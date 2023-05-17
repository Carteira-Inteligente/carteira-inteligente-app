import 'package:flutter/material.dart';

import '../Containers/card_container.dart';
import '../Labels/subtitle2_label.dart';

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
            Subtitle2Label(widget.cardTitle),
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
