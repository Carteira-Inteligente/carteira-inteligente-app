import 'dart:math';

import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../constants/images.dart';
import '../../models/authentication.dart';
import '../../models/users.dart';
import '../../utils/show_modal.dart';
import '../../widgets/Buttons/primary_buttons.dart';
import '../../widgets/Buttons/secondary_buttons.dart';
import '../Authentication/authentication_screen.dart';
import '../User/user_form_screen.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage(iInitial),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              cBlack.withOpacity(0.5),
              BlendMode.darken,
            ),
          ),
        ),
        child: Column(
          children: <Widget>[
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        SizedBox(
                          height: 350,
                          child: Image.asset(
                            iInvertedLogo,
                            alignment: Alignment.center,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 40.0,
                            right: 25.0,
                            left: 25.0,
                            bottom: 25.0,
                          ),
                          child: Text(
                            "Boas-vindas à Carteira Inteligente!",
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(25.0),
                          child: Text(
                            "Uma nova maneira de organizar suas despesas.",
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 15.0),
              child: Column(
                children: <Widget>[
                  PrimaryButton(
                    textButton: "Entrar",
                    onPressed: () => ShowModal.showModal(
                      context,
                      AuthenticationScreen(onSubmit: _authUser),
                    ),
                  ),
                  SecondaryButton(
                    textButton: "Ainda não tenho cadastro",
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            UserFormScreen(onSubmit: _addUser),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
