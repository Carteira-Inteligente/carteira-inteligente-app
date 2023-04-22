import 'package:flutter/material.dart';

class PasswordPatternLabel extends StatelessWidget {
  const PasswordPatternLabel(this.passwordPattern, {super.key});

  final String passwordPattern;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Text(
          passwordPattern,
          style: Theme.of(context).textTheme.displaySmall,
        ),
      ],
    );
  }
}
