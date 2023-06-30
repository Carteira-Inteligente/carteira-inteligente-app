import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/payment_type.dart';
import '../routes/app_routes.dart';
import '../utils/messages_utils.dart';
import '../utils/toast_message.dart';
import 'utils/request_utils.dart';

class PaymentTypeService {
  static _requestBody(String description, String type) {
    return {
      "user": {"id": 1},
      "description": description,
      "type": type,
    };
  }

  static findAll(String message) async {
    final response = await http.get(
      Uri.parse(AppRoutes.paymentTypeRoute),
    );

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(
        const Utf8Decoder().convert(response.bodyBytes),
      );
      final paymentTypes = List<PaymentType>.from(
        jsonData.map((data) => PaymentType.fromJson(data)),
      );

      return paymentTypes;
    } else {
      ToastMessage.dangerToast(MessagesUtils.findAllError(message));
      throw Exception(MessagesUtils.noRequestBodyExceptionError(
        MessagesUtils.findAllError(message),
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
    final requestBody = json.encode(_requestBody(description, type));

    final response = await http.post(
      Uri.parse(AppRoutes.paymentTypeRoute),
      body: requestBody,
      headers: requestHeader,
    );

    final jsonData = jsonDecode(
      const Utf8Decoder().convert(response.bodyBytes),
    );

    if (response.statusCode == 201) {
      final jsonData = json.decode(response.body);
      final createdPaymentType = PaymentType.fromJson(jsonData);

      ToastMessage.successToast(MessagesUtils.postSuccess(message));
      Navigator.pop(context);
      return createdPaymentType;
    } else if (response.statusCode == 400) {
      ToastMessage.dangerToast(jsonData[0]["defaultMessage"]);
    } else {
      ToastMessage.dangerToast(jsonData[0]["defaultMessage"]);
      throw Exception(MessagesUtils.requestBodyExceptionError(
        jsonData[0]["defaultMessage"],
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
    final requestBody = json.encode(_requestBody(description, type));

    final response = await http.put(
      Uri.parse("${AppRoutes.paymentTypeRoute}/${paymentType.id}"),
      body: requestBody,
      headers: requestHeader,
    );

    final jsonData = jsonDecode(
      const Utf8Decoder().convert(response.bodyBytes),
    );

    if (response.statusCode == 200) {
      final updatedAccount = PaymentType(
        id: paymentType.id,
        description: description,
        type: type,
      );

      ToastMessage.successToast(MessagesUtils.putSuccess(message));
      Navigator.pop(context);
      return updatedAccount;
    } else if (response.statusCode == 400) {
      ToastMessage.dangerToast(jsonData[0]["defaultMessage"]);
    } else {
      ToastMessage.dangerToast(jsonData[0]["defaultMessage"]);
      throw Exception(MessagesUtils.requestBodyExceptionError(
        jsonData[0]["defaultMessage"],
        response,
        requestBody,
      ));
    }
  }
}
