import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/payment_type.dart';
import '../routes/app_routes.dart';
import '../utils/messages.dart';
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
      ToastMessage.dangerToast(Messages.findAllError(message));
      throw Exception(Messages.noRequestBodyExceptionError(
        Messages.findAllError(message),
        response,
      ));
    }
  }

  static post(
    BuildContext context,
    String description,
    String type,
    String message,
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

      ToastMessage.successToast(Messages.postSuccess(message));
      Navigator.pop(context);
      return createdPaymentType;
    } else {
      ToastMessage.dangerToast(Messages.postError(message));
      throw Exception(Messages.requestBodyExceptionError(
        Messages.postError(message),
        response,
        requestBody,
      ));
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

      ToastMessage.successToast(Messages.putSuccess(message));
      Navigator.pop(context);
      return updatedAccount;
    } else {
      ToastMessage.dangerToast(Messages.putError(message));
      throw Exception(Messages.requestBodyExceptionError(
        Messages.putError(message),
        response,
        requestBody,
      ));
    }
  }
}
