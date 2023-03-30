import 'package:flutter/material.dart';

class InputLabel extends StatelessWidget {
  const InputLabel(this.label, {super.key});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Text(
          "$label:",
          textAlign: TextAlign.left,
          style: Theme.of(context).textTheme.displayMedium,
        ),
      ],
    );
  }
}
