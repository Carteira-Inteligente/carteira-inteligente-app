import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/budget.dart';
import '../routes/app_routes.dart';
import '../utils/messages_utils.dart';
import '../utils/toast_message.dart';
import 'utils/request_utils.dart';

class BudgetService {
  static findAll() async {
    final response = await http.get(
      Uri.parse(AppRoutes.budgetRoute),
    );

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(
        const Utf8Decoder().convert(response.bodyBytes),
      );
      final budgets = List<Budget>.from(
        jsonData.map((data) => Budget.fromJson(data)),
      );

      return budgets;
    } else {
      ToastMessage.dangerToast(MessagesUtils.findAllError("Orçamentos"));
      throw Exception(
        "Falha ao listar os orçamentos."
        "\nStatus code: ${response.statusCode}"
        "\nResponse body: ${response.body}",
      );
    }
  }

  static findById(Budget budget, int id) async {
    final response = await http.get(
      Uri.parse("${AppRoutes.budgetRoute}/${budget.id}"),
    );

    if (response.statusCode == 200) {
      return jsonDecode(const Utf8Decoder().convert(response.bodyBytes));
    } else {
      ToastMessage.dangerToast(MessagesUtils.findByIdError("Orçamento", id));
      throw Exception(MessagesUtils.noRequestBodyExceptionError(
        MessagesUtils.findByIdError("Orçamento", id),
        response,
      ));
    }
  }

  static post(
    BuildContext context,
    int categoryId,
    String description,
    double value,
  ) async {
    final requestBody = json.encode({
      "user": {"id": 1},
      "category": {"id": categoryId},
      "description": description,
      "value": value,
    });

    final response = await http.post(
      Uri.parse(AppRoutes.budgetRoute),
      body: requestBody,
      headers: requestHeader,
    );

    if (response.statusCode == 201) {
      final jsonData = json.decode(response.body);
      final createdBudget = Budget.fromJson(jsonData);

      ToastMessage.successToast(MessagesUtils.postSuccess("Orçamento"));
      Navigator.pop(context);
      return createdBudget;
    } else if (response.statusCode == 400) {
      ToastMessage.warningToast(MessagesUtils.notEmptyFields());
    } else {
      ToastMessage.dangerToast(MessagesUtils.postError("Orçamento"));
      throw Exception(MessagesUtils.requestBodyExceptionError(
        MessagesUtils.postError("Orçamento"),
        response,
        requestBody,
      ));
    }
  }

  static put(
    BuildContext context,
    Budget budget,
    int categoryId,
    String description,
    double value,
  ) async {
    final requestBody = json.encode({
      "user": {"id": 1},
      "category": {"id": categoryId},
      "description": description,
      "value": value,
    });

    final response = await http.put(
      Uri.parse("${AppRoutes.budgetRoute}/${budget.id}"),
      body: requestBody,
      headers: requestHeader,
    );

    if (response.statusCode == 200) {
      final updatedBudget = Budget(
        id: budget.id,
        category: budget.category,
        value: value,
        description: description,
      );

      ToastMessage.successToast(MessagesUtils.putSuccess("Orçamento"));
      Navigator.pop(context);
      return updatedBudget;
    } else if (response.statusCode == 400) {
      ToastMessage.warningToast(MessagesUtils.notEmptyFields());
    } else {
      ToastMessage.dangerToast(MessagesUtils.requestBodyExceptionError(
        MessagesUtils.putError("Orçamento"),
        response,
        requestBody,
      ));
    }
  }

  static delete(
    BuildContext context,
    Budget budget,
    int id,
  ) async {
    final response = await http.delete(
      Uri.parse("${AppRoutes.budgetRoute}/${budget.id}"),
    );

    if (response.statusCode == 200) {
      ToastMessage.successToast(MessagesUtils.deleteSuccess("Orçamento"));
      Navigator.pop(context);
    } else {
      ToastMessage.dangerToast(MessagesUtils.deleteError("Orçamento"));
      throw Exception(MessagesUtils.noRequestBodyExceptionError(
        MessagesUtils.deleteError("Orçamento"),
        response,
      ));
    }
  }
}
