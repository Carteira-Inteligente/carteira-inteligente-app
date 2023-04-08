import 'package:carteira_inteligente_app/constants/constants.dart';
import 'package:carteira_inteligente_app/widgets/Labels/input_label.dart';
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
          InputLabel(label),
          Container(
            decoration: BoxDecoration(
              color: cGrey.shade50,
              borderRadius: wInputBorderRadius,
            ),
            child: TextField(
              enabled: false,
              decoration: InputDecoration(
                hintText: details,
                hintStyle: Theme.of(context).textTheme.displaySmall,
                border: const OutlineInputBorder(
                  borderRadius: wInputBorderRadius,
                  borderSide: BorderSide(
                    color: cBlack,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
