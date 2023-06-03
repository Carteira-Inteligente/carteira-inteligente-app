import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../utils/toast_message.dart';

class UsersProvider extends InheritedWidget {
  UsersProvider({required Widget child}) : super(child: child);

  static void createUser(
    TextEditingController nameController,
    TextEditingController emailController,
    TextEditingController passwordController,
    TextEditingController confirmPasswordController,
    bool isPasswordValid,
    Function onSubmit,
  ) async {
    final name = nameController.text;
    final email = emailController.text;
    final password = passwordController.text;
    final confirmPassword = confirmPasswordController.text;

    if (name.isEmpty ||
        email.isEmpty ||
        password.isEmpty ||
        confirmPassword.isEmpty) {
      ToastMessage.showToast("Preencha todos os campos obrigatórios.");
      return;
    }

    if (!isPasswordValid) {
      ToastMessage.showToast("A senha não atende aos requisitos.");
      return;
    }

    if (password != confirmPassword) {
      ToastMessage.showToast("A confirmação de senha não coincide.");
      return;
    }

    final userData = {
      'name': name,
      'email': email,
      'password': password,
    };

    try {
      final response = await post(
        "https://seu-backend.com/api/endpoint" as Uri,
        body: userData,
      );

      if (response.statusCode == 200) {
        ToastMessage.showToast("Usuário cadastrado com sucesso.");
      } else {
        ToastMessage.showToast("Erro ao cadastrar o usuário.");
      }
    } catch (e) {
      ToastMessage.showToast("Erro ao conectar ao servidor.");
    }

    // onSubmit(name, email, password);
    // ToastMessage.showToast("Usuário $submitMessage com sucesso.");
  }

  static void editUser(
    TextEditingController nameController,
    TextEditingController emailController,
    TextEditingController passwordController,
    TextEditingController confirmPasswordController,
    bool isPasswordValid,
    Function onSubmit,
  ) async {
    final name = nameController.text;
    final email = emailController.text;
    final password = passwordController.text;
    final confirmPassword = confirmPasswordController.text;

    if (name.isEmpty ||
        email.isEmpty ||
        password.isEmpty ||
        confirmPassword.isEmpty) {
      ToastMessage.showToast("Preencha todos os campos obrigatórios.");
      return;
    }

    if (!isPasswordValid) {
      ToastMessage.showToast("A senha não atende aos requisitos.");
      return;
    }

    if (password != confirmPassword) {
      ToastMessage.showToast("A confirmação de senha não coincide.");
      return;
    }

    final userData = {
      'name': name,
      'email': email,
      'password': password,
    };

    try {
      final response = await put(
        "https://seu-backend.com/api/endpoint" as Uri,
        body: userData,
      );

      if (response.statusCode == 200) {
        ToastMessage.showToast("Usuário alterado com sucesso.");
      } else {
        ToastMessage.showToast("Erro ao alterado o usuário.");
      }
    } catch (e) {
      ToastMessage.showToast("Erro ao conectar ao servidor.");
    }

    // onSubmit(name, email, password);
    // ToastMessage.showToast("Usuário $submitMessage com sucesso.");
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    // TODO: implement updateShouldNotify
    throw UnimplementedError();
  }
}
