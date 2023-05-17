import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../constants/widgets.dart';

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
