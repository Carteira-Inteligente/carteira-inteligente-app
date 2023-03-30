import 'package:carteira_inteligente_app/constants/constants.dart';
import 'package:carteira_inteligente_app/widgets/Cards/dashboard_default_card.dart';
import 'package:flutter/material.dart';

class ToPayCard extends StatelessWidget {
  const ToPayCard(this.toPayValue, this.overdueValue, {super.key});

  final double toPayValue;
  final double overdueValue;
  @override
  Widget build(BuildContext context) {
    return DashboardDefaultCard(
      "A pagar",
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              children: const <Widget>[
                Text(
                  "Total em aberto:",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Text(
                  "R\$ $toPayValue",
                  style: const TextStyle(
                    color: cBlue,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            Row(
              children: const <Widget>[
                Text(
                  "Total em atraso:",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Text(
                  "R\$ $overdueValue",
                  style: const TextStyle(
                    color: cRed,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
