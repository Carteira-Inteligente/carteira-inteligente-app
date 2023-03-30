import 'package:carteira_inteligente_app/constants/constants.dart';
import 'package:carteira_inteligente_app/widgets/Cards/dashboard_default_card.dart';
import 'package:flutter/material.dart';

class PaidCard extends StatelessWidget {
  const PaidCard(this.paidValue, {super.key});

  final double paidValue;

  @override
  Widget build(BuildContext context) {
    return DashboardDefaultCard(
      "Pagos",
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            const Text(
              "Total pago",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.normal,
              ),
            ),
            Text(
              "R\$ $paidValue",
              style: const TextStyle(
                color: cGreen,
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
