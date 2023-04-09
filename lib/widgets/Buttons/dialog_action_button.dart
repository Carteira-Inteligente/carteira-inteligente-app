import 'package:carteira_inteligente/constants/constants.dart';
import 'package:flutter/material.dart';

class DialogActionButton extends StatelessWidget {
  const DialogActionButton(this.onPressed, this.backgroundColor, this.label,
      {super.key});

  final void Function() onPressed;
  final Color backgroundColor;
  final String label;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shape: wButtonBorderRadius,
        backgroundColor: backgroundColor,
        elevation: 0,
      ),
      child: Text(
        label,
        style: const TextStyle(
          color: cWhite,
          fontFamily: "OpenSans",
        ),
      ),
    );
  }
}
