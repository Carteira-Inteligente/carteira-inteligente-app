import 'dart:async';
import 'dart:math';

import 'package:carteira_inteligente_app/themes/light_status_bar_theme.dart';
import 'package:carteira_inteligente_app/utils/show_modal.dart';
import 'package:carteira_inteligente_app/constants/constants.dart';
import 'package:carteira_inteligente_app/models/authentication.dart';
import 'package:carteira_inteligente_app/models/users.dart';
import 'package:carteira_inteligente_app/screens/Authentication/authentication_screen.dart';
import 'package:carteira_inteligente_app/screens/User/create_user_screen.dart';
import 'package:carteira_inteligente_app/widgets/Buttons/primary_button.dart';
import 'package:carteira_inteligente_app/widgets/Buttons/secondary_button.dart';
import 'package:flutter/material.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({super.key});

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  final List<Users> _users = [];

  _addUser(String name, String email, String password) {
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

  _authUser(String email, String password) {
    final authUser = Authentication(
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
    return Scaffold(
      body: LightStatusBarTheme(
        Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: const AssetImage(iInitial),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  cBlack.withOpacity(0.5),
                  BlendMode.darken,
                )),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Column(
                  children: const <Widget>[
                    Padding(
                      padding: EdgeInsets.only(
                        top: 250.0,
                        right: 25.0,
                        left: 25.0,
                        bottom: 25.0,
                      ),
                      child: Text(
                        "Seja bem-vindo à Carteira Inteligente!",
                        style: TextStyle(
                          fontFamily: "OpenSans",
                          fontSize: 25,
                          color: cWhite,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(25.0),
                      child: Text(
                        "Uma nova maneira de organizar suas despesas.",
                        style: TextStyle(
                          fontFamily: "OpenSans",
                          fontSize: 18,
                          color: cWhite,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 250),
                  child: Column(
                    children: <Widget>[
                      PrimaryButton(
                        wLargeButtonMinimunSize,
                        "Entrar",
                        () => _openAuthUserViewModal(),
                      ),
                      SecondaryButton(
                        wLargeButtonMinimunSize,
                        "Sou novo por aqui",
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
