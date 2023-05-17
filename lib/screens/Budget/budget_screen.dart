import 'package:carteira_inteligente/constants/colors.dart';
import 'package:carteira_inteligente/constants/svgs.dart';
import 'package:carteira_inteligente/data/budgets_data.dart';
import 'package:carteira_inteligente/models/budget.dart';
import 'package:carteira_inteligente/screens/Budget/budget_details_screen.dart';
import 'package:carteira_inteligente/utils/format_currency.dart';
import 'package:carteira_inteligente/widgets/Cards/budget_card.dart';
import 'package:carteira_inteligente/widgets/Containers/rounded_icon_container.dart';
import 'package:carteira_inteligente/widgets/Containers/no_data_container.dart';
import 'package:flutter/material.dart';

class BudgetScreen extends StatefulWidget {
  const BudgetScreen({super.key});

  @override
  State<BudgetScreen> createState() => _BudgetScreenState();
}

class _BudgetScreenState extends State<BudgetScreen> {
  var formatCurrency = getFormatCurrency();
  final List<Budget> _budgets = budgetsList;

  Widget _buildBudgetCards(BuildContext context, Budget budget) {
    return BudgetCard(
      () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const BudgetDetailsScreen(),
          ),
        );
      },
      budget.idCategory == 1
          ? RoundedIconContainer(
              sElectricity,
              cAmber.shade700,
              14,
            )
          : RoundedIconContainer(
              sHouse,
              cCyan.shade700,
              14,
            ),
      budget.idCategory == 1 ? "Energia elétrica" : "Casa",
      budget.value,
      budget.value / 880 * 1,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        _budgets.isEmpty
            ? const NoDataContainer("orçamentos")
            : SizedBox(
                height: MediaQuery.of(context).size.height * 0.71,
                child: ListView.builder(
                  itemCount: _budgets.length,
                  itemBuilder: (context, index) {
                    final budget = _budgets[index];
                    return _buildBudgetCards(context, budget);
                  },
                ),
              ),
      ],
    );
  }
}
