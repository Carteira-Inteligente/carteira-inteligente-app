import 'package:carteira_inteligente/widgets/Containers/card_container.dart';
import 'package:carteira_inteligente/widgets/Containers/divider_container.dart';
import 'package:carteira_inteligente/widgets/Containers/progres_bar_container.dart';
import 'package:carteira_inteligente/widgets/Labels/budget_value_label.dart';
import 'package:carteira_inteligente/widgets/Labels/input_label.dart';
import 'package:carteira_inteligente/widgets/Labels/list_tile_label.dart';
import 'package:flutter/material.dart';

class BudgetCard extends StatelessWidget {
  const BudgetCard(
      this.onTap, this.pageIcon, this.description, this.value, this.percentage,
      {super.key});

  final void Function() onTap;
  final Widget pageIcon;
  final String description;
  final double value;
  final double percentage;

  @override
  Widget build(BuildContext context) {
    return CardContainer(
      ListTile(
        onTap: onTap,
        title: Padding(
          padding: const EdgeInsets.symmetric(vertical: 6.0),
          child: Row(
            children: <Widget>[
              pageIcon,
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: ListTileLabel(description),
              ),
            ],
          ),
        ),
        subtitle: Column(
          children: <Widget>[
            const DividerContainer(),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: InputLabel("Disponível"),
            ),
            BudgetValueLabel(value, 880.00),
            ProgresBarContainer(percentage),
          ],
        ),
      ),
    );
  }
}
