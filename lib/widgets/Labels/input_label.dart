import 'dart:convert' show utf8;
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
    var encoded = utf8.encode(label);
    var decoded = utf8.decode(encoded);
    return Row(
      children: <Widget>[
        Text(
          decoded,
          style: decoded == "Excluir usuário"
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
