import 'package:carteira_inteligente_app/widgets/Containers/button_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../constants/constants.dart';

class SecondaryButton extends StatelessWidget {
  const SecondaryButton(this.textButton, this.onPressed, {super.key});

  final String textButton;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ButtonContainer(
      OutlinedButton(
        style: OutlinedButton.styleFrom(
          minimumSize: wButtonMinimunSize,
          shape: const RoundedRectangleBorder(
            borderRadius: wButtonBorderRadius,
          ),
          side: const BorderSide(color: cBlue),
          elevation: 0,
          backgroundColor: cWhite,
        ),
        onPressed: onPressed,
        child: Text(
          textButton,
          style: const TextStyle(
            fontFamily: "OpenSans",
            fontSize: 16,
            color: cBlue,
          ),
        ),
      ),
    );
  }
}
