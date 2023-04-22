import 'package:carteira_inteligente/widgets/Containers/card_container.dart';
import 'package:flutter/material.dart';

class DashboardLargeCard extends StatefulWidget {
  const DashboardLargeCard(this.cardTitle, {super.key});

  final String cardTitle;

  @override
  State<DashboardLargeCard> createState() => _DashboardLargeCardState();
}

class _DashboardLargeCardState extends State<DashboardLargeCard> {
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
                widget.cardTitle,
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
