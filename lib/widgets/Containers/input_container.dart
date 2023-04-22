import 'package:carteira_inteligente/constants/constants.dart';
import 'package:carteira_inteligente/widgets/Labels/input_label.dart';
import 'package:flutter/material.dart';

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
            decoration: const BoxDecoration(
              color: cWhite,
              borderRadius: wInputBorderRadius,
            ),
            child: widget,
          ),
        ],
      ),
    );
  }
}
