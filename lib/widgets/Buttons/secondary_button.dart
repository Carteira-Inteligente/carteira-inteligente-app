import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../constants/widgets.dart';
import '../Containers/button_container.dart';

class SecondaryButton extends StatelessWidget {
  const SecondaryButton(this.textButton, this.onPressed, {super.key});

  final String textButton;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ButtonContainer(
      OutlinedButton(
        style: OutlinedButton.styleFrom(
          minimumSize: Size(MediaQuery.of(context).size.width * 0.9, 60),
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
