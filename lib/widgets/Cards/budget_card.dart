import 'package:carteira_inteligente/constants/constants.dart';
import 'package:carteira_inteligente/utils/format_currency.dart';
import 'package:carteira_inteligente/widgets/Containers/card_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BudgetCard extends StatelessWidget {
  BudgetCard(
      this.onTap, this.pageIcon, this.description, this.value, this.percentage,
      {super.key});

  final void Function() onTap;
  final SvgPicture pageIcon;
  final String description;
  final double value;
  final double percentage;
  final formatCurrency = getFormatCurrency();

  @override
  Widget build(BuildContext context) {
    return CardContainer(
      ListTile(
        onTap: onTap,
        title: Padding(
          padding: const EdgeInsets.symmetric(vertical: 6.0),
          child: Row(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  borderRadius: wBorderRadius50,
                  border: Border.all(
                    color: cGrey.shade300,
                  ),
                ),
                child: CircleAvatar(
                  backgroundColor: cTransparent,
                  radius: 14,
                  child: Container(
                    padding: const EdgeInsets.all(6.0),
                    child: pageIcon,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  description,
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
              ),
            ],
          ),
        ),
        subtitle: Column(
          children: <Widget>[
            Divider(
              color: cGrey.shade400,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                children: <Widget>[
                  Text(
                    "Disponível",
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                ],
              ),
            ),
            Row(
              children: <Widget>[
                Text(
                  formatCurrency.format(value),
                  style: const TextStyle(
                    fontFamily: "OpenSans",
                    color: cBlack,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  " de R\$ 880,00",
                  style: Theme.of(context).textTheme.displaySmall,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: SizedBox(
                height: 10,
                width: MediaQuery.of(context).size.width,
                child: Stack(
                  alignment: Alignment.centerLeft,
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        color: cGrey.shade300,
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                    FractionallySizedBox(
                      widthFactor: percentage,
                      child: Container(
                        decoration: BoxDecoration(
                          color: cGreen,
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
