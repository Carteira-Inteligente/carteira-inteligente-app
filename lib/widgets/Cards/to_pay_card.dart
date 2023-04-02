import 'package:carteira_inteligente_app/constants/constants.dart';
import 'package:carteira_inteligente_app/utils/format_currency.dart';
import 'package:carteira_inteligente_app/widgets/Cards/dashboard_default_card.dart';
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
            const Text(
              "Total em aberto",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.normal,
              ),
            ),
            Text(
              formatCurrency.format(toPayValue),
              style: const TextStyle(
                color: cBlue,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              "Total em atraso",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.normal,
              ),
            ),
            Text(
              formatCurrency.format(overdueValue),
              style: const TextStyle(
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
