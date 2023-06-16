import 'dart:convert';

import 'package:carteira_inteligente/models/entry.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/budget.dart';
import '../routes/app_routes.dart';
import '../utils/toast_message.dart';
import '../widgets/Containers/no_data_container.dart';

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
      ToastMessage.dangerToast("Falha ao listar os lançamentos.");
      throw Exception(
        "Falha ao listar os lançamentos."
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
      "dueDate": dueDate,
      "paidDate": paidDate,
    });

    final response = await http.post(
      Uri.parse(AppRoutes.entryRoute),
      body: requestBody,
      headers: {"Content-Type": "application/json"},
    );

    if (response.statusCode == 201) {
      final jsonData = json.decode(response.body);
      final createdEntry = Budget.fromJson(jsonData);

      ToastMessage.successToast("Lançamento criado com sucesso.");
      Navigator.pop(context);
      return createdEntry;
    } else {
      ToastMessage.dangerToast("Falha ao criar o lançamento.");
      throw Exception(
        "Falha ao criar o lançamento."
        "\nStatus code: ${response.statusCode}"
        "\nRequest body: $requestBody"
        "\nResponse body: ${response.body}",
      );
    }
  }
}
