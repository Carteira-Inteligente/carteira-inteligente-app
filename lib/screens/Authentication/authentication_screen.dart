import 'package:flutter/material.dart';

import '../../constants/images.dart';
import '../../main.dart';
import '../../widgets/Buttons/primary_buttons.dart';
import '../../widgets/Inputs/input_email.dart';
import '../../widgets/Inputs/input_password.dart';
import '../../widgets/Labels/title_labels.dart';
import '../ForgotPassword/forgot_password_screen.dart';

class AuthenticationScreen extends StatefulWidget {
  const AuthenticationScreen({
    super.key,
    required this.onSubmit,
  });

  final void Function(
    String,
    String,
  ) onSubmit;

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
          child: TitleLabel(label: "Que bom que você voltou!"),
        ),
        InputEmail(
          label: "E-mail",
          controller: _emailController,
          onSubmit: () {},
        ),
        InputPassword(
          label: "Senha",
          controller: _passwordController,
          onSubmit: () {},
        ),
        TextButton(
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const ForgotPasswordScreen(),
            ),
          ),
          child: Text(
            "Esqueci minha senha",
            style: Theme.of(context).textTheme.labelMedium,
          ),
        ),
        PrimaryButton(
          textButton: "Entrar",
          onPressed: () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const CarteiraInteligenteApp(),
            ),
          ),
        ),
      ],
    );
  }
}
