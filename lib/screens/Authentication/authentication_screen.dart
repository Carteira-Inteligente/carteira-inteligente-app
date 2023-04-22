import 'package:carteira_inteligente/constants/constants.dart';
import 'package:carteira_inteligente/screens/ForgotPassword/forgot_password_screen.dart';
import 'package:carteira_inteligente/widgets/Buttons/primary_button.dart';
import 'package:carteira_inteligente/widgets/Inputs/input_email.dart';
import 'package:carteira_inteligente/widgets/Inputs/input_password.dart';
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
        SizedBox(
          width: 300,
          child: Image.asset(
            iLinearLogo,
            alignment: Alignment.center,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 16.0, bottom: 8.0),
          child: Text(
            "Que bom que você voltou!",
            style: Theme.of(context).textTheme.titleSmall,
          ),
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
          wLargeButtonMinimunSize,
          "Entrar",
          () {},
        ),
      ],
    );
  }
}
