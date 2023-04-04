import 'package:carteira_inteligente_app/constants/constants.dart';
import 'package:carteira_inteligente_app/widgets/Containers/button_container.dart';
import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton(this.buttonSize, this.textButton, this.onPressed,
      {super.key});

  final Size buttonSize;
  final String textButton;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ButtonContainer(
      ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: buttonSize,
          shape: wButtonBorderRadius,
          backgroundColor: cBlue,
          elevation: 0,
        ),
        onPressed: onPressed,
        child: Text(
          textButton,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
    );
  }
}
