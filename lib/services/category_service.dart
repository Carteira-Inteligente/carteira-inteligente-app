import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../constants/svgs.dart';
import '../models/category.dart';
import '../routes/app_routes.dart';
import '../utils/messages_utils.dart';
import '../utils/toast_message.dart';
import 'utils/request_utils.dart';

class CategoryService {
  static _requestBody(String description) {
    return {
      "user": {"id": 1},
      "description": description,
      "pathIcon": sCategory,
      "iconColor": 0xFF146AA0,
      "backgroundColor": 0xFFD9E8F6,
    };
  }

  static findAll() async {
    final response = await http.get(
      Uri.parse(AppRoutes.categoryRoute),
    );

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(
        const Utf8Decoder().convert(response.bodyBytes),
      );
      final categories = List<Category>.from(
        jsonData.map((data) => Category.fromJson(data)),
      );

      return categories;
    } else if (response.statusCode == 404) {
      return [];
    } else {
      ToastMessage.dangerToast(MessagesUtils.findAllError("Categorias"));
      throw Exception(MessagesUtils.noRequestBodyExceptionError(
        MessagesUtils.findAllError("Categorias"),
        response,
      ));
    }
  }

  static post(
    BuildContext context,
    String description,
  ) async {
    final requestBody = json.encode(_requestBody(description));

    final response = await http.post(
      Uri.parse(AppRoutes.categoryRoute),
      body: requestBody,
      headers: requestHeader,
    );

    if (response.statusCode == 201) {
      final jsonData = json.decode(response.body);
      final createdCategory = Category.fromJson(jsonData);

      ToastMessage.successToast(MessagesUtils.postSuccess("Categoria"));
      Navigator.pop(context);
      return createdCategory;
    } else if (response.statusCode == 400) {
      ToastMessage.warningToast(
          "Já existe uma categoria cadastrada com esta descrição.");
    } else {
      ToastMessage.dangerToast(MessagesUtils.postError("Categoria"));
      throw Exception(MessagesUtils.requestBodyExceptionError(
        MessagesUtils.postError("Categoria"),
        response,
        requestBody,
      ));
    }
  }

  static put(
    BuildContext context,
    Category category,
    String description,
  ) async {
    final requestBody = json.encode(_requestBody(description));

    final response = await http.put(
      Uri.parse("${AppRoutes.categoryRoute}/${category.id}"),
      body: requestBody,
      headers: requestHeader,
    );

    if (response.statusCode == 200) {
      final updatedCategory = Category(
        id: category.id,
        description: description,
        backgroundColor: const Color(0xFFD9E8F6),
        iconColor: const Color(0xFF146AA0),
        pathIcon: sCategory,
      );

      ToastMessage.successToast(MessagesUtils.putSuccess("Categoria"));
      Navigator.pop(context);
      return updatedCategory;
    } else {
      ToastMessage.dangerToast(MessagesUtils.putError("Categoria"));
      throw Exception(MessagesUtils.requestBodyExceptionError(
        MessagesUtils.putError("Categoria"),
        response,
        requestBody,
      ));
    }
  }
}
