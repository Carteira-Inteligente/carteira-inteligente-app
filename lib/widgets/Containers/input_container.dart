import 'package:flutter/material.dart';

import '../../constants/widgets.dart';
import '../Labels/input_label.dart';

class InputContainer extends StatelessWidget {
  const InputContainer(this.label, this.widget, {super.key});

  final String label;
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Column(
        children: <Widget>[
          InputLabel(label),
          Container(
            decoration: wBoxDecoration,
            child: widget,
          ),
        ],
      ),
    );
  }
}
