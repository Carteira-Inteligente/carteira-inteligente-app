import 'package:flutter/material.dart';

import '../Containers/card_container.dart';
import '../Labels/subtitle_labels.dart';

class DashboardLargeCard extends StatefulWidget {
  const DashboardLargeCard({
    super.key,
    required this.cardTitle,
    required this.chart,
  });

  final String cardTitle;
  final Widget chart;

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
            SubtitleLabel(label: widget.cardTitle),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: double.infinity,
                height: 300,
                child: widget.chart,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DashboardSmallCard extends StatelessWidget {
  const DashboardSmallCard({
    super.key,
    required this.cardTitle,
    required this.child,
  });

  final String cardTitle;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.5,
      height: 170,
      child: CardContainer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SubtitleLabel(label: cardTitle),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: child,
            ),
          ],
        ),
      ),
    );
  }
}
