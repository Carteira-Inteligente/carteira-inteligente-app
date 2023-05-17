import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../utils/format_currency.dart';
import 'input_label.dart';

class BudgetValueLabel extends StatelessWidget {
  const BudgetValueLabel(this.value, this.availableValue, {super.key});

  final double value;
  final double availableValue;

  @override
  Widget build(BuildContext context) {
    final formatCurrency = getFormatCurrency();
    return Row(
      children: <Widget>[
        Text(
          formatCurrency.format(value),
          style: const TextStyle(
            fontFamily: "OpenSans",
            color: cBlack,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        InputLabel(" de R\$ ${formatCurrency.format(availableValue)}"),
      ],
    );
  }
}
