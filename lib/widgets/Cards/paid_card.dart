import 'package:carteira_inteligente_app/constants/constants.dart';
import 'package:carteira_inteligente_app/widgets/Cards/dashboard_default_card.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PaidCard extends StatelessWidget {
  PaidCard(this.paidValue, {super.key});

  final double paidValue;
  final formatCurrency = NumberFormat.currency(
    locale: "pt-BR",
    symbol: "R\$",
    decimalDigits: 2,
  );

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
              formatCurrency.format(paidValue),
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
