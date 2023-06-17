import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/budget.dart';
import '../models/entry.dart';
import '../routes/app_routes.dart';
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
    } else if (response.statusCode == 404) {
      ToastMessage.dangerToast("Não há nenhum lançamento cadastrado.");
    } else {
      ToastMessage.dangerToast("Falha ao listar lançamentos.");
      throw Exception(
        "Falha ao listar lançamentos."
        "\nStatus code: ${response.statusCode}"
        "\nResponse body: ${response.body}",
      );
    }
  }

  static findById(Entry entry, int id) async {
    final response = await http.get(
      Uri.parse("${AppRoutes.entryRoute}/${entry.id}"),
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      ToastMessage.dangerToast("Falha ao listar lançamento '$id'.");
      throw Exception(
        "Falha ao listar lançamento '$id'."
        "\nStatus code: ${response.statusCode}"
        "\nResponse body: ${response.body}",
      );
    }
  }

  static post(
    BuildContext context,
    bool paid,
    String description,
    int idCategory,
    String period,
    int idPaymentType,
    double paidValue,
    DateTime dueDate,
    DateTime paidDate,
  ) async {
    final requestBody = json.encode({
      "user": {"id": 1},
      "paid": paid,
      "description": description,
      "category": {"id": idCategory},
      "period": period,
      "paymentType": {"id": idPaymentType},
      "paidValue": paidValue,
      "dueDate": dueDate.toIso8601String(),
      "paidDate": paidDate.toIso8601String(),
    });

    final response = await http.post(
      Uri.parse(AppRoutes.entryRoute),
      body: requestBody,
      headers: {"Content-Type": "application/json"},
    );

    print(requestBody);

    if (response.statusCode == 201) {
      final jsonData = json.decode(response.body);
      final createdEntry = Budget.fromJson(jsonData);

      ToastMessage.successToast("Lançamento criado com sucesso.");
      Navigator.pop(context);
      return createdEntry;
    } else {
      ToastMessage.dangerToast("Falha ao criar lançamento.");
      throw Exception(
        "Falha ao criar lançamento."
        "\nStatus code: ${response.statusCode}"
        "\nRequest body: $requestBody"
        "\nResponse body: ${response.body}",
      );
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
      ToastMessage.successToast("Lançamento excluído com sucesso.");
      Navigator.pop(context);
    } else {
      ToastMessage.dangerToast("Falha ao excluir lançamento '$id'.");
      throw Exception(
        "Falha ao excluir lançamento '$id'."
        "\nStatus code: ${response.statusCode}"
        "\nResponse body: ${response.body}",
      );
    }
  }
}
