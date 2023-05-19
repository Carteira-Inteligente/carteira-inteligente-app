import 'package:carteira_inteligente/widgets/Labels/list_tile_label.dart';
import 'package:flutter/material.dart';

class PaymentTypeTitleLabel extends StatelessWidget {
  const PaymentTypeTitleLabel({
    super.key,
    required this.label,
  });

  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTileLabel(label: label),
        ),
      ],
    );
  }
}
