import 'package:carteira_inteligente/constants/constants.dart';
import 'package:flutter/material.dart';

class DialogSecondaryButton extends StatelessWidget {
  const DialogSecondaryButton({super.key});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        shape: wButtonBorderRadius,
        side: const BorderSide(color: cBlue),
        elevation: 0,
        backgroundColor: cWhite,
      ),
      onPressed: () => Navigator.pop(context),
      child: const Text(
        "Voltar",
        style: TextStyle(
          fontFamily: "OpenSans",
          color: cBlue,
        ),
      ),
    );
  }
}
