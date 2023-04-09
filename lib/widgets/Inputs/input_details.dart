import 'package:carteira_inteligente/constants/constants.dart';
import 'package:carteira_inteligente/widgets/Labels/input_label.dart';
import 'package:flutter/material.dart';

class InputDetails extends StatelessWidget {
  const InputDetails(this.label, this.details, {super.key});

  final String label;
  final String details;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Column(
        children: <Widget>[
          Row(
            children: [
              InputLabel(label),
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
