import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/payment_type.dart';
import '../routes/app_routes.dart';
import '../utils/toast_message.dart';

class PaymentTypeService {
  static findAll(String message) async {
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
      ToastMessage.dangerToast("Falha ao listar $message.");
      throw Exception(
        "Falha ao listar $message."
        "\nStatus code: ${response.statusCode}"
        "\nResponse body: ${response.body}",
      );
    }
  }

  static post(
    BuildContext context,
    String description,
    String type,
    String message,
    String message2,
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

      ToastMessage.successToast("$message com sucesso.");
      Navigator.pop(context);
      return createdPaymentType;
    } else {
      ToastMessage.dangerToast("Falha ao criar $message2.");
      throw Exception(
        "Falha ao criar $message2."
        "\nStatus code: ${response.statusCode}"
        "\nRequest body: $requestBody"
        "\nResponse body: ${response.body}",
      );
    }
  }

  static put(
    BuildContext context,
    PaymentType paymentType,
    String description,
    String type,
    String message,
  ) async {
    final requestBody = json.encode({
      "user": {"id": 1},
      "description": description,
      "type": type,
    });

    final response = await http.put(
      Uri.parse("${AppRoutes.paymentTypeRoute}/${paymentType.id}"),
      body: requestBody,
      headers: {"Content-Type": "application/json"},
    );

    if (response.statusCode == 200) {
      final updatedAccount = PaymentType(
        id: paymentType.id,
        description: description,
        type: type,
      );

      ToastMessage.successToast("$message atualizada com sucesso.");
      Navigator.pop(context);
      return updatedAccount;
    } else {
      ToastMessage.dangerToast("Falha ao atualizar $message.");
      throw Exception(
        "Falha ao atualizar $message."
        "\nStatus code: ${response.statusCode}"
        "\nRequest body: $requestBody"
        "\nResponse body: ${response.body}",
      );
    }
  }
}
