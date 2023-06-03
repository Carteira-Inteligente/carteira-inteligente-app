import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../constants/widgets.dart';
import '../Containers/button_containers.dart';

class SecondaryButton extends StatelessWidget {
  const SecondaryButton({
    super.key,
    required this.textButton,
    required this.onPressed,
  });

  final String textButton;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ButtonContainer(
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          minimumSize: Size(MediaQuery.of(context).size.width * 0.9, 60),
          shape: wButtonBorderRadius,
          side: BorderSide(color: cBlue.shade800),
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

class SmallSecondaryButton extends StatelessWidget {
  const SmallSecondaryButton({super.key});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        shape: wButtonBorderRadius,
        minimumSize: Size(MediaQuery.of(context).size.width * 0.7, 44),
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
