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
        minimumSize: Size(MediaQuery.of(context).size.width * 0.5, 44),
        side: BorderSide(color: cBlue.shade800),
        elevation: 0,
        backgroundColor: cWhite,
      ),
      onPressed: () => Navigator.pop(context),
      child: Text(
        "Voltar",
        style: TextStyle(
          fontFamily: "OpenSans",
          color: cBlue.shade800,
        ),
      ),
    );
  }
}
