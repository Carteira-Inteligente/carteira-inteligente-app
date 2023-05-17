import 'package:flutter/material.dart';

import '../../utils/format_currency.dart';

class DashboardCardLabel extends StatelessWidget {
  const DashboardCardLabel({
    super.key,
    required this.cardSubtitle,
    required this.value,
    required this.valueColor,
  });

  final String cardSubtitle;
  final double value;
  final Color valueColor;

  @override
  Widget build(BuildContext context) {
    final formatCurrency = getFormatCurrency();

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
