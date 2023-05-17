import 'package:flutter/material.dart';

import '../../constants/images.dart';
import '../../main.dart';
import '../../widgets/Buttons/primary_button.dart';
import '../../widgets/Inputs/input_email.dart';
import '../../widgets/Inputs/input_password.dart';
import '../../widgets/Labels/subtitle2_label.dart';
import '../ForgotPassword/forgot_password_screen.dart';

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
        SizedBox(
          width: 300,
          child: Image.asset(
            iLinearLogo,
            alignment: Alignment.center,
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(top: 8.0),
          child: Subtitle2Label("Que bom que você voltou!"),
        ),
        InputEmail(
          "E-mail",
          _emailController,
          () {},
        ),
        InputPassword(
          "Senha",
          _passwordController,
          () {},
          (_) {},
        ),
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ForgotPasswordScreen(),
              ),
            );
          },
          child: Text(
            "Esqueci minha senha",
            style: Theme.of(context).textTheme.labelMedium,
          ),
        ),
        PrimaryButton(
          "Entrar",
          () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const CarteiraInteligenteApp(),
              ),
            );
          },
        ),
      ],
    );
  }
}
