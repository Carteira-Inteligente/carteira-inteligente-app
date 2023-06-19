import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../constants/svgs.dart';
import '../models/category.dart';
import '../routes/app_routes.dart';
import '../utils/messages.dart';
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
      ToastMessage.dangerToast(Messages.findAllError("Categorias"));
      throw Exception(Messages.noRequestBodyExceptionError(
        Messages.findAllError("Categorias"),
        response,
      ));
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

      ToastMessage.successToast(Messages.postSuccess("Categoria"));
      Navigator.pop(context);
      return createdCategory;
    } else {
      ToastMessage.dangerToast(Messages.postError("Categoria"));
      throw Exception(Messages.requestBodyExceptionError(
        Messages.postError("Categoria"),
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
    final requestBody = json.encode({
      "user": {"id": 1},
      "description": description,
      "pathIcon": sCategory,
      "iconColor": 0xFF1F70A2,
      "backgroundColor": 0xFFBED3E7,
    });

    final response = await http.put(
      Uri.parse("${AppRoutes.categoryRoute}/${category.id}"),
      body: requestBody,
      headers: {"Content-Type": "application/json"},
    );

    if (response.statusCode == 200) {
      final updatedCategory = Category(
        id: category.id,
        description: description,
        backgroundColor: const Color(0xFFBED3E7),
        iconColor: const Color(0xFF1F70A2),
        pathIcon: sCategory,
      );

      ToastMessage.successToast(Messages.putSuccess("Categoria"));
      Navigator.pop(context);
      return updatedCategory;
    } else {
      ToastMessage.dangerToast(Messages.putError("Categoria"));
      throw Exception(Messages.requestBodyExceptionError(
        Messages.putError("Categoria"),
        response,
        requestBody,
      ));
    }
  }
}
