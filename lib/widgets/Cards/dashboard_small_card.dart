import 'package:flutter/material.dart';

import '../Containers/card_container.dart';
import '../Labels/subtitle2_label.dart';

class DashboardSmallCard extends StatelessWidget {
  const DashboardSmallCard(this.cardTitle, this.widget, {super.key});

  final String cardTitle;
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.5,
      height: 170,
      child: CardContainer(
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Subtitle2Label(cardTitle),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: widget,
            ),
          ],
        ),
      ),
    );
  }
}
