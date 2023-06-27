import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/entry.dart';
import '../routes/app_routes.dart';
import '../utils/messages_utils.dart';
import '../utils/toast_message.dart';
import 'utils/request_utils.dart';

class EntryService {
  static _requestBody(
    bool paid,
    String description,
    int categoryId,
    String period,
    int paymentTypeId,
    double paidValue,
    DateTime dueDate,
    DateTime paidDate,
  ) {
    return {
      "user": {"id": 1},
      "paid": paid,
      "description": description,
      "category": {"id": categoryId},
      "period": period,
      "paymentType": {"id": paymentTypeId},
      "paidValue": paidValue,
      "dueDate": dueDate.toIso8601String(),
      "paidDate": paidDate.toIso8601String(),
    };
  }

  static findAll() async {
    final response = await http.get(
      Uri.parse(AppRoutes.entryRoute),
    );

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(
        const Utf8Decoder().convert(response.bodyBytes),
      );
      final entries = List<Entry>.from(
        jsonData.map((data) => Entry.fromJson(data)),
      );

      return entries;
    } else {
      ToastMessage.dangerToast(MessagesUtils.findAllError("Lançamentos"));
      throw Exception(MessagesUtils.noRequestBodyExceptionError(
        MessagesUtils.findAllError("Lançamentos"),
        response,
      ));
    }
  }

  static findById(Entry entry, int id) async {
    final response = await http.get(
      Uri.parse("${AppRoutes.entryRoute}/${entry.id}"),
    );

    if (response.statusCode == 200) {
      return jsonDecode(const Utf8Decoder().convert(response.bodyBytes));
    } else {
      ToastMessage.dangerToast(MessagesUtils.findByIdError("Lançamento", id));
      throw Exception(MessagesUtils.noRequestBodyExceptionError(
        MessagesUtils.findByIdError("Lançamento", id),
        response,
      ));
    }
  }

  static post(
    BuildContext context,
    bool paid,
    String description,
    int categoryId,
    String period,
    int paymentTypeId,
    double paidValue,
    DateTime dueDate,
    DateTime paidDate,
  ) async {
    final requestBody = json.encode(_requestBody(
      paid,
      description,
      categoryId,
      period,
      paymentTypeId,
      paidValue,
      dueDate,
      paidDate,
    ));

    final response = await http.post(
      Uri.parse(AppRoutes.entryRoute),
      body: requestBody,
      headers: requestHeader,
    );

    if (response.statusCode == 201) {
      final jsonData = json.decode(response.body);
      final createdEntry = Entry.fromJson(jsonData);

      ToastMessage.successToast(MessagesUtils.postSuccess("Lançamento"));
      Navigator.pop(context);
      return createdEntry;
    } else if (response.statusCode == 400) {
      ToastMessage.warningToast(MessagesUtils.notEmptyFields());
    } else {
      ToastMessage.dangerToast(MessagesUtils.postError("Lançamento"));
      throw Exception(MessagesUtils.requestBodyExceptionError(
        MessagesUtils.postError("Lançamento"),
        response,
        requestBody,
      ));
    }
  }

  static put(
    BuildContext context,
    Entry entry,
    int categoryId,
    int paymentTypeId,
    String description,
    String period,
    double paidValue,
    DateTime paidDate,
    bool paid,
    DateTime dueDate,
  ) async {
    final requestBody = json.encode(_requestBody(
      paid,
      description,
      categoryId,
      period,
      paymentTypeId,
      paidValue,
      dueDate,
      paidDate,
    ));

    final response = await http.put(
      Uri.parse("${AppRoutes.entryRoute}/${entry.id}"),
      body: requestBody,
      headers: requestHeader,
    );

    if (response.statusCode == 200) {
      final updatedEntry = Entry(
        id: entry.id,
        paid: paid,
        description: description,
        category: entry.category,
        period: period,
        paymentType: entry.paymentType,
        paidValue: paidValue,
        dueDate: dueDate,
        paidDate: paidDate,
      );

      ToastMessage.successToast(MessagesUtils.putSuccess("Lançamento"));
      Navigator.pop(context);
      return updatedEntry;
    } else if (response.statusCode == 400) {
      ToastMessage.warningToast(MessagesUtils.notEmptyFields());
    } else {
      ToastMessage.dangerToast(MessagesUtils.putError("Lançamento"));
      throw Exception(MessagesUtils.requestBodyExceptionError(
        MessagesUtils.putError("Lançamento"),
        response,
        requestBody,
      ));
    }
  }

  static patch(
    Entry entry,
    DateTime paidDate,
    bool paid,
  ) async {
    final requestBody = json.encode({
      "paidDate": paidDate.toIso8601String(),
      "paid": paid,
    });

    final response = await http.patch(
      Uri.parse("${AppRoutes.entryRoute}/${entry.id}"),
      body: requestBody,
      headers: requestHeader,
    );

    if (response.statusCode == 200) {
      final updatedEntry = Entry(
        id: entry.id,
        paid: paid,
        description: entry.description,
        category: entry.category,
        period: entry.period,
        paymentType: entry.paymentType,
        paidValue: entry.paidValue,
        dueDate: entry.dueDate,
        paidDate: paidDate,
      );

      ToastMessage.successToast(MessagesUtils.patchSuccess(paid));
      return updatedEntry;
    } else {
      ToastMessage.dangerToast(MessagesUtils.patchError(paid));
      throw Exception(MessagesUtils.requestBodyExceptionError(
        MessagesUtils.patchError(paid),
        response,
        requestBody,
      ));
    }
  }

  static delete(
    BuildContext context,
    Entry entry,
    int id,
  ) async {
    final response = await http.delete(
      Uri.parse("${AppRoutes.entryRoute}/${entry.id}"),
    );

    if (response.statusCode == 200) {
      ToastMessage.successToast(MessagesUtils.deleteSuccess("Lançamento"));
      Navigator.pop(context);
    } else {
      ToastMessage.dangerToast(MessagesUtils.deleteError("Lançamento"));
      throw Exception(MessagesUtils.noRequestBodyExceptionError(
        MessagesUtils.deleteError("Lançamento"),
        response,
      ));
    }
  }
}
