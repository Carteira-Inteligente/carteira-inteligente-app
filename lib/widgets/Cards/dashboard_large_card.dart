import 'package:flutter/material.dart';

import '../Containers/card_container.dart';
import '../Labels/subtitle2_label.dart';

class DashboardLargeCard extends StatefulWidget {
  const DashboardLargeCard({
    super.key,
    required this.cardTitle,
  });

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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Subtitle2Label(label: widget.cardTitle),
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
