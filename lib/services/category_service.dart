import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../constants/svgs.dart';
import '../models/category.dart';
import '../routes/app_routes.dart';
import '../utils/toast_message.dart';

class CategoryService {
  static findAll() async {
    final response = await http.get(
      Uri.parse(AppRoutes.categoryRoute),
    );

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final categories = List<Category>.from(
        jsonData.map((data) => Category.fromJson(data)),
      );

      return categories;
    } else {
      ToastMessage.dangerToast("Falha ao listar as categorias.");
      throw Exception(
        "Falha ao listar as categorias."
        "\nStatus code: ${response.statusCode}"
        "\nResponse body: ${response.body}",
      );
    }
  }

  static post(
    BuildContext context,
    String description,
  ) async {
    final requestBody = json.encode({
      "user": {"id": 1},
      "description": description,
      "pathIcon": sCategory,
      "iconColor": 0xFF1F70A2,
      "backgroundColor": 0xFFBED3E7,
    });

    final response = await http.post(
      Uri.parse(AppRoutes.categoryRoute),
      body: requestBody,
      headers: {"Content-Type": "application/json"},
    );

    if (response.statusCode == 201) {
      final jsonData = json.decode(response.body);
      final createdCategory = Category.fromJson(jsonData);

      ToastMessage.successToast("Categoria criada com sucesso.");
      Navigator.pop(context);
      return createdCategory;
    } else {
      ToastMessage.dangerToast("Falha ao criar a categoria.");
      throw Exception(
        "Falha ao criar a categoria."
        "\nStatus code: ${response.statusCode}"
        "\nRequest body: $requestBody"
        "\nResponse body: ${response.body}",
      );
    }
  }
}
