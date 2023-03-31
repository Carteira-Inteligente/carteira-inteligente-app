import 'dart:math';

import 'package:carteira_inteligente_app/utils/show_modal.dart';
import 'package:carteira_inteligente_app/constants/constants.dart';
import 'package:carteira_inteligente_app/models/authentication.dart';
import 'package:carteira_inteligente_app/models/users.dart';
import 'package:carteira_inteligente_app/screens/Authentication/authentication_screen.dart';
import 'package:carteira_inteligente_app/screens/User/create_user_screen.dart';
import 'package:carteira_inteligente_app/widgets/Buttons/primary_button.dart';
import 'package:carteira_inteligente_app/widgets/Buttons/secondary_button.dart';
import 'package:carteira_inteligente_app/widgets/Containers/initial_container.dart';
import 'package:flutter/material.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({super.key});

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  final List<Users> _users = [
    Users(
      id: 1,
      name: "Thiago Proença",
      email: "thiago@email.com",
      password: "51999999999",
    ),
  ];

  _addUser(
    String name,
    String email,
    String password,
  ) {
    final newUser = Users(
      id: Random().nextInt(999).toInt(),
      name: name,
      email: email,
      password: password,
    );

    setState(() {
      _users.add(newUser);
    });

    Future.delayed(const Duration(milliseconds: 500), () {
      Navigator.of(context).pop();
    });
  }

  _authUser(
    String email,
    String password,
  ) {
    final authUser = Authetication(
      email: email,
      password: password,
    );
  }

  _openAuthUserViewModal() {
    ShowModal.showModal(
      context,
      AuthenticationScreen(_authUser),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InitialContainer(
      "Seja bem-vindo à Carteira Digital!",
      "Preencha os campos abaixo para criar seu usuário.",
      Padding(
        padding: const EdgeInsets.only(top: 250),
        child: Column(
          children: <Widget>[
            PrimaryButton(
              wLargeButtonMinimunSize,
              "Login",
              () => _openAuthUserViewModal(),
            ),
            SecondaryButton(
              wLargeButtonMinimunSize,
              "Novo usuário",
              () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CreateUserScreen(_addUser),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
