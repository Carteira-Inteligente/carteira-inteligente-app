import 'package:flutter/material.dart';

import 'list_tile_label.dart';

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
