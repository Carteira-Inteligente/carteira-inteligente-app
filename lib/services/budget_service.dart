import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/budget.dart';
import '../routes/app_routes.dart';
import '../utils/toast_message.dart';

class BudgetService {
  static findAll() async {
    final response = await http.get(
      Uri.parse(AppRoutes.budgetRoute),
    );

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final budgets = List<Budget>.from(
        jsonData.map((data) => Budget.fromJson(data)),
      );

      return budgets;
    } else {
      ToastMessage.dangerToast("Falha ao listar os orçamentos.");
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
      return json.decode(response.body);
    } else {
      ToastMessage.dangerToast("Falha ao listar orçamento '$id'.");
      throw Exception(
        "Falha ao listar orçamento '$id'."
        "\nStatus code: ${response.statusCode}"
        "\nResponse body: ${response.body}",
      );
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
      headers: {"Content-Type": "application/json"},
    );

    if (response.statusCode == 201) {
      final jsonData = json.decode(response.body);
      final createdBudget = Budget.fromJson(jsonData);

      ToastMessage.successToast("Orçamento criado com sucesso.");
      Navigator.pop(context);
      return createdBudget;
    } else {
      ToastMessage.dangerToast("Falha ao criar o orçamento.");
      throw Exception(
        "Falha ao criar o orçamento."
        "\nStatus code: ${response.statusCode}"
        "\nRequest body: $requestBody"
        "\nResponse body: ${response.body}",
      );
    }
  }
}
