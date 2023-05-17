import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../constants/widgets.dart';

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
