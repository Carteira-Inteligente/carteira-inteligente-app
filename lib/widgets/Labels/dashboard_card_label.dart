import 'package:flutter/material.dart';

import '../../utils/format_currency.dart';

class DashboardCardLabel extends StatelessWidget {
  DashboardCardLabel(this.cardSubtitle, this.value, this.valueColor,
      {super.key});

  final String cardSubtitle;
  final double value;
  final Color valueColor;
  final formatCurrency = getFormatCurrency();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          cardSubtitle,
          style: Theme.of(context).textTheme.displaySmall,
        ),
        Text(
          formatCurrency.format(value),
          style: TextStyle(
            fontFamily: "OpenSans",
            color: valueColor,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
