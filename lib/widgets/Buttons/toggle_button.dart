import 'package:carteira_inteligente/constants/colors.dart';
import 'package:carteira_inteligente/constants/widgets.dart';
import 'package:carteira_inteligente/widgets/Labels/input_label.dart';
import 'package:flutter/material.dart';

class ToggleButton extends StatefulWidget {
  const ToggleButton(this.label, {super.key});

  final String label;

  @override
  State<ToggleButton> createState() => _ToggleButtonState();
}

class _ToggleButtonState extends State<ToggleButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Row(
        children: <Widget>[
          InputLabel(widget.label),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: SizedBox(
              width: 50,
              height: 30,
              child: Switch.adaptive(
                activeColor: cBlue,
                value: false,
                onChanged: (value) {},
              ),
            ),
          ),
        ],
      ),
    );
  }
}
