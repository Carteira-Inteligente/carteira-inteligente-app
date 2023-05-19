import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../constants/widgets.dart';

class DialogActionButton extends StatelessWidget {
  const DialogActionButton({
    super.key,
    required this.onPressed,
    required this.backgroundColor,
    required this.label,
  });

  final void Function() onPressed;
  final Color backgroundColor;
  final String label;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: label == "Editar usuário"
            ? null
            : Size(MediaQuery.of(context).size.width * 0.5, 44),
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
