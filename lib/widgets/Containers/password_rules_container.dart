import 'package:flutter/material.dart';

import '../Labels/password_pattern_label.dart';
import '../Labels/subtitle_label.dart';

class PasswordRulesContainer extends StatelessWidget {
  const PasswordRulesContainer(this.labelColor, {super.key});

  final Color labelColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: const <Widget>[
            SubtitleLabel("Sua senha deve conter pelo menos:"),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              PasswordPatternLabel(
                "・ Uma letra maiúscula e uma minúscula;",
                labelColor,
              ),
              PasswordPatternLabel(
                "・ Um número;",
                labelColor,
              ),
              PasswordPatternLabel(
                "・ Um caracter especial;",
                labelColor,
              ),
              PasswordPatternLabel(
                "・ Mínimo 8 caracteres.",
                labelColor,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
