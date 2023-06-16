import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/payment_type.dart';
import '../routes/app_routes.dart';
import '../utils/toast_message.dart';

class PaymentTypeService {
  static findAll() async {
    final response = await http.get(
      Uri.parse(AppRoutes.paymentTypeRoute),
    );

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final paymentTypes = List<PaymentType>.from(
        jsonData.map((data) => PaymentType.fromJson(data)),
      );

      return paymentTypes;
    } else {
      ToastMessage.dangerToast("Falha ao listar as contas.");
      throw Exception(
        "Falha ao listar as contas."
        "\nStatus code: ${response.statusCode}"
        "\nResponse body: ${response.body}",
      );
    }
  }

  static post(
    BuildContext context,
    String description,
    String type,
  ) async {
    final requestBody = json.encode({
      "user": {"id": 1},
      "description": description,
      "type": type,
    });

    final response = await http.post(
      Uri.parse(AppRoutes.paymentTypeRoute),
      body: requestBody,
      headers: {"Content-Type": "application/json"},
    );

    if (response.statusCode == 201) {
      final jsonData = json.decode(response.body);
      final createdPaymentType = PaymentType.fromJson(jsonData);

      ToastMessage.successToast("Conta criada com sucesso.");
      Navigator.pop(context);
      return createdPaymentType;
    } else {
      ToastMessage.dangerToast("Falha ao criar a conta.");
      throw Exception(
        "Falha ao criar a conta."
        "\nStatus code: ${response.statusCode}"
        "\nRequest body: $requestBody"
        "\nResponse body: ${response.body}",
      );
    }
  }
}
