import 'package:carteira_inteligente_app/widgets/Containers/button_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../constants/constants.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton(this.textButton, this.onPressed, {super.key});

  final String textButton;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ButtonContainer(
      ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: wButtonMinimunSize,
          shape: const RoundedRectangleBorder(
            borderRadius: wButtonBorderRadius,
          ),
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
