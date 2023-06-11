import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';

import '../utils/toast_message.dart';

class CategoriesProvider extends InheritedWidget {
  CategoriesProvider({required Widget child}) : super(child: child);

  static void createCategory(
    TextEditingController descriptionController,
  ) async {
    final description = descriptionController.text;

    if (description.isEmpty) {
      ToastMessage.showToast("Preencha todos os campos obrigatórios.");
      return;
    }

    const url = "https://seu-backend.com/api/categorias";
    final response = await http.post(
      Uri.parse(url),
      body: {'description': description},
    );

    if (response.statusCode == 200) {
      ToastMessage.showToast("Categoria cadastrada com sucesso.");
    } else {
      ToastMessage.showToast("Falha ao cadastrar a categoria.");
    }
  }

  static void editCategory(
    TextEditingController descriptionController,
  ) async {
    final description = descriptionController.text;

    if (description.isEmpty) {
      ToastMessage.showToast("Preencha todos os campos obrigatórios.");
      return;
    }

    const url = "https://seu-backend.com/api/categorias";
    final response = await http.put(
      Uri.parse(url),
      body: {'description': description},
    );

    if (response.statusCode == 200) {
      ToastMessage.showToast("Categoria alterada com sucesso.");
    } else {
      ToastMessage.showToast("Falha ao alterar a categoria.");
    }
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    // TODO: implement updateShouldNotify
    throw UnimplementedError();
  }
}
