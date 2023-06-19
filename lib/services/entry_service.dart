import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/entry.dart';
import '../routes/app_routes.dart';
import '../utils/messages.dart';
import '../utils/toast_message.dart';

class EntryService {
  static findAll() async {
    final response = await http.get(
      Uri.parse(AppRoutes.entryRoute),
    );

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final entries = List<Entry>.from(
        jsonData.map((data) => Entry.fromJson(data)),
      );

      return entries;
    } else {
      ToastMessage.dangerToast(Messages.findAllError("Lançamentos"));
      throw Exception(Messages.noRequestBodyExceptionError(
        Messages.findAllError("Lançamentos"),
        response,
      ));
    }
  }

  static findById(Entry entry, int id) async {
    final response = await http.get(
      Uri.parse("${AppRoutes.entryRoute}/${entry.id}"),
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      ToastMessage.dangerToast(Messages.findByIdError("Lançamento", id));
      throw Exception(Messages.noRequestBodyExceptionError(
        Messages.findByIdError("Lançamento", id),
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
    final requestBody = json.encode({
      "user": {"id": 1},
      "paid": paid,
      "description": description,
      "category": {"id": categoryId},
      "period": period,
      "paymentType": {"id": paymentTypeId},
      "paidValue": paidValue,
      "dueDate": dueDate.toIso8601String(),
      "paidDate": paidDate.toIso8601String(),
    });

    final response = await http.post(
      Uri.parse(AppRoutes.entryRoute),
      body: requestBody,
      headers: {"Content-Type": "application/json"},
    );

    if (response.statusCode == 201) {
      final jsonData = json.decode(response.body);
      final createdEntry = Entry.fromJson(jsonData);

      ToastMessage.successToast(Messages.postSuccess("Lançamento"));
      Navigator.pop(context);
      return createdEntry;
    } else if (response.statusCode == 400) {
      ToastMessage.warningToast(Messages.notEmptyFields());
    } else {
      ToastMessage.dangerToast(Messages.postError("Lançamento"));
      throw Exception(Messages.requestBodyExceptionError(
        Messages.postError("Lançamento"),
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
    final requestBody = json.encode({
      "user": {"id": 1},
      "category": {"id": categoryId},
      "paymentType": {"id": paymentTypeId},
      "description": description,
      "period": period,
      "paidValue": paidValue,
      "paidDate": paidDate.toIso8601String(),
      "paid": paid,
      "dueDate": dueDate.toIso8601String()
    });

    final response = await http.put(
      Uri.parse("${AppRoutes.entryRoute}/${entry.id}"),
      body: requestBody,
      headers: {"Content-Type": "application/json"},
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

      ToastMessage.successToast(Messages.putSuccess("Lançamento"));
      Navigator.pop(context);
      return updatedEntry;
    } else if (response.statusCode == 400) {
      ToastMessage.warningToast(Messages.notEmptyFields());
    } else {
      ToastMessage.dangerToast(Messages.putError("Lançamento"));
      throw Exception(Messages.requestBodyExceptionError(
        Messages.putError("Lançamento"),
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
      ToastMessage.successToast(Messages.deleteSuccess("Lançamento"));
      Navigator.pop(context);
    } else {
      ToastMessage.dangerToast(Messages.deleteError("Lançamento"));
      throw Exception(Messages.noRequestBodyExceptionError(
        Messages.deleteError("Lançamento"),
        response,
      ));
    }
  }
}
