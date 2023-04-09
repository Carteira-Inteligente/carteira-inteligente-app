import 'package:carteira_inteligente/themes/dark_status_bar_theme.dart';
import 'package:carteira_inteligente/widgets/Buttons/card_button.dart';
import 'package:carteira_inteligente/widgets/Cards/custom_card.dart';
import 'package:carteira_inteligente/widgets/Cards/paid_card.dart';
import 'package:carteira_inteligente/widgets/Cards/to_pay_card.dart';
import 'package:carteira_inteligente/widgets/Labels/title_label.dart';
import 'package:flutter/material.dart';

class BudgetScreen extends StatefulWidget {
  const BudgetScreen({super.key});

  @override
  State<BudgetScreen> createState() => _BudgetScreenState();
}

class _BudgetScreenState extends State<BudgetScreen> {
  @override
  Widget build(BuildContext context) {
    return DarkStatusBarTheme(
      Column(
        children: <Widget>[
          Row(
            children: const <Widget>[
              TitleLabel("Orçamento"),
            ],
          ),
          Column(
            children: [
              Row(
                children: [
                  CardButton("Novo grupo", () {}),
                  // CardButton("Nova categoria", () {}),
                ],
              ),
              Row(
                children: [
                  ToPayCard(123, 123),
                  PaidCard(123),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
