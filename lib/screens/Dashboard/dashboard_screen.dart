import 'package:carteira_inteligente/constants/constants.dart';
import 'package:carteira_inteligente/widgets/Cards/dashboard_large_card.dart';
import 'package:carteira_inteligente/widgets/Cards/dashboard_small_card.dart';
import 'package:carteira_inteligente/widgets/Labels/dashboard_card_label.dart';
import 'package:carteira_inteligente/widgets/Labels/subtitle_label.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: const <Widget>[
            SubtitleLabel("Mensal"),
          ],
        ),
        Row(
          children: <Widget>[
            DashboardSmallCard(
              "A pagar",
              Column(
                children: <Widget>[
                  DashboardCardLabel(
                    "Total previsto",
                    123.54,
                    cBlue,
                  ),
                  DashboardCardLabel(
                    "Total em atraso",
                    45.32,
                    cRed,
                  ),
                ],
              ),
            ),
            DashboardSmallCard(
              "Pagos",
              DashboardCardLabel(
                "Total pago",
                1003.30,
                cGreen,
              ),
            ),
          ],
        ),
        Row(
          children: const <Widget>[
            SubtitleLabel("Anual"),
          ],
        ),
        Row(
          children: const <Widget>[
            DashboardLargeCard("Gráfico de evolução"),
          ],
        ),
      ],
    );
  }
}
