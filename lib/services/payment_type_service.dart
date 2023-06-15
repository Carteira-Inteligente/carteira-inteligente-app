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
      throw Exception("Falha ao listar as contas.");
    }
  }

  static post(
    BuildContext context,
    String description,
    String type,
  ) async {
    final response = await http.post(
      Uri.parse(AppRoutes.paymentTypeRoute),
      body: json.encode({
        "user": {"id": 1},
        "description": description,
        "type": type,
      }),
      headers: {"Content-Type": "application/json"},
    );

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final createdPaymentType = PaymentType.fromJson(jsonData);

      ToastMessage.successToast("Conta criada com sucesso.");
      Navigator.pop(context);
      return createdPaymentType;
    } else {
      ToastMessage.dangerToast("Falha ao criar a conta.");
    }
  }
}
