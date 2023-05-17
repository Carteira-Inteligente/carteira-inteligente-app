import 'package:flutter/material.dart';

import '../../constants/widgets.dart';
import '../Containers/button_container.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.textButton,
    required this.onPressed,
  });

  final String textButton;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ButtonContainer(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: Size(MediaQuery.of(context).size.width * 0.9, 60),
          shape: wButtonBorderRadius,
          backgroundColor: Theme.of(context).primaryColor,
          elevation: 0,
        ),
        onPressed: onPressed,
        child: Text(
          textButton,
          style: Theme.of(context).textTheme.labelLarge,
        ),
      ),
    );
  }
}
