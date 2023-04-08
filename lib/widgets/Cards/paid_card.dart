import 'package:carteira_inteligente_app/constants/constants.dart';
import 'package:carteira_inteligente_app/utils/format_currency.dart';
import 'package:carteira_inteligente_app/widgets/Cards/dashboard_default_card.dart';
import 'package:flutter/material.dart';

class PaidCard extends StatelessWidget {
  PaidCard(this.paidValue, {super.key});

  final double paidValue;
  final formatCurrency = getFormatCurrency();

  @override
  Widget build(BuildContext context) {
    return DashboardDefaultCard(
      "Pagos",
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Text(
              "Total pago",
              style: Theme.of(context).textTheme.displaySmall,
            ),
            Text(
              formatCurrency.format(paidValue),
              style: const TextStyle(
                fontFamily: "OpenSans",
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
