import 'package:carteira_inteligente/constants/constants.dart';
import 'package:flutter/material.dart';

class InputLabel extends StatelessWidget {
  const InputLabel(this.label, {super.key});

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
