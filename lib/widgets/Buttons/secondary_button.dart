import 'package:carteira_inteligente/constants/colors.dart';
import 'package:carteira_inteligente/constants/widgets.dart';
import 'package:carteira_inteligente/widgets/Containers/button_container.dart';
import 'package:flutter/material.dart';

class SecondaryButton extends StatelessWidget {
  const SecondaryButton(this.buttonSize, this.textButton, this.onPressed,
      {super.key});

  final Size buttonSize;
  final String textButton;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ButtonContainer(
      OutlinedButton(
        style: OutlinedButton.styleFrom(
          minimumSize: buttonSize,
          shape: wButtonBorderRadius,
          side: const BorderSide(color: cBlue),
          elevation: 0,
          backgroundColor: cWhite,
        ),
        onPressed: onPressed,
        child: Text(
          textButton,
          style: Theme.of(context).textTheme.labelMedium,
        ),
      ),
    );
  }
}
