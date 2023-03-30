import 'package:carteira_inteligente_app/widgets/Cards/dashboard_chart_card.dart';
import 'package:carteira_inteligente_app/widgets/Cards/paid_card.dart';
import 'package:carteira_inteligente_app/widgets/Cards/to_pay_card.dart';
import 'package:carteira_inteligente_app/widgets/Containers/subtitle_screen_container.dart';
import 'package:carteira_inteligente_app/widgets/Containers/title_screen_container.dart';
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
            TitleScreenContainer("Dashboard"),
          ],
        ),
        Row(
          children: const <Widget>[
            SubtitleScreenContainer("Mensal"),
          ],
        ),
        Row(
          children: <Widget>[
            ToPayCard(134.54, 45.32),
            PaidCard(1003.30),
          ],
        ),
        Row(
          children: const <Widget>[
            SubtitleScreenContainer("Anual"),
          ],
        ),
        Row(
          children: const <Widget>[
            DashboardChartCard(),
          ],
        ),
      ],
    );
  }
}
