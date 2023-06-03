import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../Labels/input_label.dart';

class ToggleButton extends StatefulWidget {
  const ToggleButton({
    super.key,
    required this.label,
  });

  final String label;

  @override
  State<ToggleButton> createState() => _ToggleButtonState();
}

class _ToggleButtonState extends State<ToggleButton> {
  bool isPaid = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Row(
        children: <Widget>[
          InputLabel(label: widget.label),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: SizedBox(
              width: 50,
              height: 30,
              child: Switch.adaptive(
                activeColor: cBlue.shade800,
                value: isPaid,
                onChanged: (value) => setState(() {
                  isPaid = !isPaid;
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
