import 'package:flutter/material.dart';

import '../Containers/card_container.dart';
import '../Containers/divider_container.dart';
import '../Containers/progress_containers.dart';
import '../Containers/rounded_icon_container.dart';
import '../Labels/budget_value_label.dart';
import '../Labels/input_label.dart';
import '../Labels/list_tile_label.dart';

class BudgetCard extends StatelessWidget {
  const BudgetCard({
    super.key,
    required this.onTap,
    required this.pathIcon,
    required this.iconColor,
    required this.backgroundColor,
    required this.description,
    required this.usedValue,
    required this.value,
    required this.percentage,
  });

  final void Function() onTap;
  final String pathIcon;
  final Color iconColor;
  final Color backgroundColor;
  final String description;
  final double usedValue;
  final double value;
  final double percentage;

  @override
  Widget build(BuildContext context) {
    return CardContainer(
      child: ListTile(
        onTap: onTap,
        title: Padding(
          padding: const EdgeInsets.symmetric(vertical: 6.0),
          child: Row(
            children: <Widget>[
              RoundedIconContainer(
                pathIcon: pathIcon,
                iconColor: iconColor,
                backgroundColor: backgroundColor,
                radius: 18,
                heigth: 18,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: ListTileLabel(label: description),
              ),
            ],
          ),
        ),
        subtitle: Column(
          children: <Widget>[
            const DividerContainer(),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: InputLabel(label: "Utilizado"),
            ),
            BudgetValueLabel(
              usedValue: usedValue,
              budgetValue: value,
            ),
            ProgressBarContainer(percentage: percentage),
          ],
        ),
      ),
    );
  }
}
