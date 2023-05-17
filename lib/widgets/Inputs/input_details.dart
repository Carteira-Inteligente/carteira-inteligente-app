import 'package:flutter/material.dart';

import '../Labels/input_label.dart';

class InputDetails extends StatelessWidget {
  const InputDetails({
    super.key,
    required this.label,
    required this.details,
  });

  final String label;
  final String details;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              InputLabel(label: label),
            ],
          ),
          Row(
            children: <Widget>[
              Text(
                details,
                style: Theme.of(context).textTheme.labelSmall,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
