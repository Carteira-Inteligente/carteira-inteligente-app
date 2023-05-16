import 'package:carteira_inteligente/widgets/Labels/password_pattern_label.dart';
import 'package:carteira_inteligente/widgets/Labels/subtitle_label.dart';
import 'package:flutter/material.dart';

class PasswordRulesLabel extends StatelessWidget {
  const PasswordRulesLabel({super.key});

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
            children: const <Widget>[
              PasswordPatternLabel("・ Uma letra maiúscula e uma minúscula;"),
              PasswordPatternLabel("・ Um número;"),
              PasswordPatternLabel("・ Um caracter especial;"),
              PasswordPatternLabel("・ Mínimo 8 caracteres."),
            ],
          ),
        ),
      ],
    );
  }
}
