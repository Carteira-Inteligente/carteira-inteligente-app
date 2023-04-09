import 'package:carteira_inteligente/constants/constants.dart';
import 'package:carteira_inteligente/utils/format_currency.dart';
import 'package:carteira_inteligente/widgets/Cards/dashboard_default_card.dart';
import 'package:flutter/material.dart';

class ToPayCard extends StatelessWidget {
  ToPayCard(this.toPayValue, this.overdueValue, {super.key});

  final double toPayValue;
  final double overdueValue;
  final formatCurrency = getFormatCurrency();

  @override
  Widget build(BuildContext context) {
    return DashboardDefaultCard(
      "A pagar",
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Text(
              "Total em aberto",
              style: Theme.of(context).textTheme.displaySmall,
            ),
            Text(
              formatCurrency.format(toPayValue),
              style: const TextStyle(
                fontFamily: "OpenSans",
                color: cBlue,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "Total em atraso",
              style: Theme.of(context).textTheme.displaySmall,
            ),
            Text(
              formatCurrency.format(overdueValue),
              style: const TextStyle(
                fontFamily: "OpenSans",
                color: cRed,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
