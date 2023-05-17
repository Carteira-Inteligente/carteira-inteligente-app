import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class InputLabel extends StatelessWidget {
  const InputLabel({
    super.key,
    required this.label,
  });

  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Text(
          label,
          style: label == "Excluir conta"
              ? const TextStyle(
                  fontFamily: "OpenSans",
                  fontSize: 16,
                  color: cRed,
                  fontWeight: FontWeight.normal,
                )
              : Theme.of(context).textTheme.displaySmall,
        ),
      ],
    );
  }
}
