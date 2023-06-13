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
    required this.categoryIcon,
    required this.categoryIconColor,
    required this.categoryBackgroundColor,
    required this.description,
    required this.value,
    required this.availableValue,
    required this.percentage,
  });

  final void Function() onTap;
  final String categoryIcon;
  final Color categoryIconColor;
  final Color categoryBackgroundColor;
  final String description;
  final double value;
  final double availableValue;
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
                svgPicture: categoryIcon,
                svgColor: categoryIconColor,
                backgroundColor: categoryBackgroundColor,
                radius: 14,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
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
              usedValue: value,
              availableValue: availableValue,
            ),
            ProgressBarContainer(percentage: percentage),
          ],
        ),
      ),
    );
  }
}
