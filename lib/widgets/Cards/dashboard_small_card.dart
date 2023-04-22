import 'package:carteira_inteligente/widgets/Containers/card_container.dart';
import 'package:flutter/material.dart';

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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                cardTitle,
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ),
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
