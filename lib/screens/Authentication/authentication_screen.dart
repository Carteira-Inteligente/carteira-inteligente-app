import 'package:carteira_inteligente_app/constants/constants.dart';
import 'package:carteira_inteligente_app/widgets/Buttons/primary_button.dart';
import 'package:carteira_inteligente_app/widgets/Inputs/input_password.dart';
import 'package:carteira_inteligente_app/widgets/Inputs/input_text.dart';
import 'package:flutter/material.dart';

class AuthenticationScreen extends StatefulWidget {
  const AuthenticationScreen(this.onSubmit, {super.key});

  final void Function(String, String) onSubmit;

  @override
  State<AuthenticationScreen> createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        InputText(
          "E-mail",
          _emailController,
          TextInputType.emailAddress,
          () {},
        ),
        InputPassword(
          "Senha",
          _passwordController,
          () {},
        ),
        TextButton(
          onPressed: () {},
          child: const Text("Esqueci minha senha"),
        ),
        PrimaryButton(
          wSmallButtonMinimunSize,
          "Entrar",
          () {},
        ),
      ],
    );
  }
}
