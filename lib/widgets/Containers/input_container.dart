import 'package:flutter/material.dart';

import '../../constants/widgets.dart';
import '../Labels/input_label.dart';

class InputContainer extends StatelessWidget {
  const InputContainer({
    super.key,
    required this.label,
    required this.child,
  });

  final String label;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Column(
        children: <Widget>[
          InputLabel(label: label),
          Container(
            decoration: wBoxDecoration,
            child: child,
          ),
        ],
      ),
    );
  }
}
