import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../Labels/password_pattern_label.dart';
import '../Labels/subtitle_labels.dart';

class PasswordRulesContainer extends StatelessWidget {
  const PasswordRulesContainer({
    super.key,
    required this.hasLowerCase,
    required this.hasUpperCase,
    required this.hasSpecialCharacters,
    required this.hasNumber,
    required this.hasLength,
  });

  final bool hasLowerCase;
  final bool hasUpperCase;
  final bool hasSpecialCharacters;
  final bool hasNumber;
  final bool hasLength;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: const <Widget>[
            SubtitleLabel(
              padding: EdgeInsets.only(top: 8.0),
              label: "Sua senha deve conter pelo menos:",
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Column(
            children: <Widget>[
              PasswordPatternLabel(
                label: " Uma letra maiúscula e uma minúscula;",
                labelColor: hasLowerCase && hasUpperCase ? cGreen : cRed,
              ),
              PasswordPatternLabel(
                label: " Um número;",
                labelColor: hasNumber ? cGreen : cRed,
              ),
              PasswordPatternLabel(
                label: " Um caracter especial;",
                labelColor: hasSpecialCharacters ? cGreen : cRed,
              ),
              PasswordPatternLabel(
                label: " Mínimo 8 caracteres.",
                labelColor: hasLength ? cGreen : cRed,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
