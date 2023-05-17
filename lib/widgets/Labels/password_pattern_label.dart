import 'package:flutter/material.dart';

class PasswordPatternLabel extends StatelessWidget {
  const PasswordPatternLabel(this.passwordPattern, this.labelColor,
      {super.key});

  final String passwordPattern;
  final Color labelColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Text(
          passwordPattern,
          style: TextStyle(
            // Tema utilizado para labels e informações gerais
            fontFamily: "OpenSans",
            fontSize: 16,
            fontWeight: FontWeight.normal,
            color: labelColor,
          ),
        ),
      ],
    );
  }
}
