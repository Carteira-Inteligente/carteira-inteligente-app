import 'package:carteira_inteligente_app/constants/constants.dart';
import 'package:carteira_inteligente_app/widgets/Containers/button_container.dart';
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
