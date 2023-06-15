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
      throw Exception("Falha ao listar os orçamentos.");
    }
  }

  static post(
    BuildContext context,
    int categoryId,
    String description,
    double value,
  ) async {
    final response = await http.post(
      Uri.parse(AppRoutes.budgetRoute),
      body: json.encode({
        "user": {"id": 1},
        "category": {"id": categoryId},
        "description": description,
        "value": value,
      }),
      headers: {"Content-Type": "application/json"},
    );

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final createdBudget = Budget.fromJson(jsonData);

      ToastMessage.successToast("Orçamento criado com sucesso.");
      Navigator.pop(context);
      return createdBudget;
    } else {
      ToastMessage.dangerToast("Falha ao criar o orçamento.");
    }
  }
}
