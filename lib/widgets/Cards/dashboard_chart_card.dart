import 'package:carteira_inteligente_app/widgets/Containers/card_container.dart';
import 'package:flutter/material.dart';

class DashboardChartCard extends StatefulWidget {
  const DashboardChartCard({super.key});

  @override
  State<DashboardChartCard> createState() => _DashboardChartCardState();
}

class _DashboardChartCardState extends State<DashboardChartCard> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: CardContainer(
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Gráfico de evolução",
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: SizedBox(
                width: double.infinity,
                height: 300,
                child: Placeholder(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
