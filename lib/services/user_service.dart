import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../main.dart';
import '../models/users.dart';
import '../routes/app_routes.dart';
import '../utils/messages_utils.dart';
import '../utils/toast_message.dart';
import 'utils/request_utils.dart';

class UsersService {
  static findAll(String message) async {
    final response = await http.get(
      Uri.parse(AppRoutes.userRoute),
    );

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(
        const Utf8Decoder().convert(response.bodyBytes),
      );
      final users = List<Users>.from(
        jsonData.map((data) => Users.fromJson(data)),
      );

      return users;
    } else {
      ToastMessage.dangerToast(MessagesUtils.findAllError("Usuários"));
      throw Exception(MessagesUtils.noRequestBodyExceptionError(
        MessagesUtils.findAllError("Usuários"),
        response,
      ));
    }
  }

  static findById(Users user, int id) async {
    final response = await http.get(
      Uri.parse("${AppRoutes.userRoute}/${user.id}"),
    );

    if (response.statusCode == 200) {
      return jsonDecode(const Utf8Decoder().convert(response.bodyBytes));
    } else {
      ToastMessage.dangerToast(MessagesUtils.findByIdError("Usuário", id));
      throw Exception(MessagesUtils.noRequestBodyExceptionError(
        MessagesUtils.findByIdError("Usuário", id),
        response,
      ));
    }
  }

  static post(
    BuildContext context,
    String name,
    String email,
    String password,
  ) async {
    final requestBody = json.encode({
      "name": name,
      "email": email,
      "password": password,
    });

    final response = await http.post(
      Uri.parse(AppRoutes.userRoute),
      body: requestBody,
      headers: requestHeader,
    );

    if (response.statusCode == 201) {
      final jsonData = json.decode(response.body);
      final createdUser = Users.fromJson(jsonData);

      ToastMessage.successToast(MessagesUtils.postSuccess("Usuário"));
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CarteiraInteligenteApp(),
        ),
      );
      return createdUser;
    } else if (response.statusCode == 400) {
      ToastMessage.warningToast(MessagesUtils.notEmptyFields());
    } else {
      ToastMessage.dangerToast(MessagesUtils.postError("Usuário"));
      throw Exception(MessagesUtils.requestBodyExceptionError(
        MessagesUtils.postError("Usuário"),
        response,
        requestBody,
      ));
    }
  }

  static put(
    BuildContext context,
    Users user,
    String name,
    String email,
    String password,
  ) async {
    final requestBody = json.encode({
      "name": name,
      "email": email,
      "password": password,
    });

    final response = await http.put(
      Uri.parse("${AppRoutes.userRoute}/${user.id}"),
      body: requestBody,
      headers: requestHeader,
    );

    if (response.statusCode == 200) {
      final updatedUsers = Users(
        id: user.id,
        name: name,
        email: email,
        password: password,
      );

      ToastMessage.successToast(MessagesUtils.putSuccess("Usuário"));
      Navigator.pop(context);
      return updatedUsers;
    } else if (response.statusCode == 400) {
      ToastMessage.warningToast(MessagesUtils.notEmptyFields());
    } else {
      ToastMessage.dangerToast(MessagesUtils.requestBodyExceptionError(
        MessagesUtils.putError("Usuário"),
        response,
        requestBody,
      ));
    }
  }

  static delete(
    BuildContext context,
    Users user,
    int id,
  ) async {
    final response = await http.delete(
      Uri.parse("${AppRoutes.userRoute}/${user.id}"),
    );

    if (response.statusCode == 200) {
      ToastMessage.successToast(MessagesUtils.deleteSuccess("Usuário"));
      Navigator.pop(context);
    } else {
      ToastMessage.dangerToast(MessagesUtils.deleteError("Usuário"));
      throw Exception(MessagesUtils.noRequestBodyExceptionError(
        MessagesUtils.deleteError("Usuário"),
        response,
      ));
    }
  }
}
