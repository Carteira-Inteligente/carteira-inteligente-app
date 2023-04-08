import 'package:carteira_inteligente_app/widgets/Containers/card_container.dart';
import 'package:flutter/material.dart';

class DashboardDefaultCard extends StatelessWidget {
  const DashboardDefaultCard(this.cardText, this.widget, {super.key});

  final String cardText;
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
                cardText,
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ),
            widget,
          ],
        ),
      ),
    );
  }
}
