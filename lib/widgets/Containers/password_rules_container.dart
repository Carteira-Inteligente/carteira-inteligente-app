import 'package:flutter/material.dart';

import '../Labels/password_pattern_label.dart';
import '../Labels/subtitle_label.dart';

class PasswordRulesContainer extends StatelessWidget {
  const PasswordRulesContainer({
    super.key,
    required this.labelColor,
  });

  final Color labelColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: const <Widget>[
            SubtitleLabel(label: "Sua senha deve conter pelo menos:"),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              PasswordPatternLabel(
                label: "・ Uma letra maiúscula e uma minúscula;",
                labelColor: labelColor,
              ),
              PasswordPatternLabel(
                label: "・ Um número;",
                labelColor: labelColor,
              ),
              PasswordPatternLabel(
                label: "・ Um caracter especial;",
                labelColor: labelColor,
              ),
              PasswordPatternLabel(
                label: "・ Mínimo 8 caracteres.",
                labelColor: labelColor,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
