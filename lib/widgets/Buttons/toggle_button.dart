import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../Labels/input_label.dart';

class ToggleButton extends StatefulWidget {
  const ToggleButton(this.label, {super.key});

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
          InputLabel(widget.label),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: SizedBox(
              width: 50,
              height: 30,
              child: Switch.adaptive(
                activeColor: cBlue,
                value: isPaid,
                onChanged: (value) => setState(() {
                  if (isPaid == false) {
                    isPaid = true;
                  } else {
                    isPaid = false;
                  }
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
