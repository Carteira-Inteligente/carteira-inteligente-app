import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../widgets/Cards/dashboard_cards.dart';
import '../../widgets/Labels/dashboard_card_label.dart';
import '../../widgets/Labels/subtitle_label.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: const <Widget>[
            SubtitleLabel(
              padding: EdgeInsets.all(8.0),
              label: "Mensal",
            ),
          ],
        ),
        Row(
          children: <Widget>[
            DashboardSmallCard(
              cardTitle: "A pagar",
              child: Column(
                children: const <Widget>[
                  DashboardCardLabel(
                    cardSubtitle: "Total previsto",
                    value: 123.54,
                    valueColor: cBlue,
                  ),
                  DashboardCardLabel(
                    cardSubtitle: "Total em atraso",
                    value: 45.32,
                    valueColor: cRed,
                  ),
                ],
              ),
            ),
            const DashboardSmallCard(
              cardTitle: "Pagos",
              child: DashboardCardLabel(
                cardSubtitle: "Total pago",
                value: 1003.30,
                valueColor: cGreen,
              ),
            ),
          ],
        ),
        Row(
          children: const <Widget>[
            SubtitleLabel(
              padding: EdgeInsets.all(8.0),
              label: "Anual",
            ),
          ],
        ),
        Row(
          children: const <Widget>[
            DashboardLargeCard(cardTitle: "Gráfico de evolução"),
          ],
        ),
      ],
    );
  }
}
