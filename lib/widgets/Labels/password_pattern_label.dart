import 'package:flutter/material.dart';

class PasswordPatternLabel extends StatelessWidget {
  const PasswordPatternLabel({
    super.key,
    required this.label,
    required this.labelColor,
  });

  final String label;
  final Color labelColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Text(
          label,
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
