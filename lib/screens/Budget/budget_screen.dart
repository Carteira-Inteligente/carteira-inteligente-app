import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../constants/svgs.dart';
import '../../data/budgets_data.dart';
import '../../models/budget.dart';
import '../../utils/format_currency.dart';
import '../../widgets/Cards/budget_card.dart';
import '../../widgets/Containers/no_data_container.dart';
import '../../widgets/Containers/rounded_icon_container.dart';
import 'budget_details_screen.dart';

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
              svgPicture: sElectricity,
              backgroundColor: cAmber.shade700,
              radius: 14,
            )
          : RoundedIconContainer(
              svgPicture: sHouse,
              backgroundColor: cCyan.shade700,
              radius: 14,
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
            ? const NoDataContainer(description: "orçamentos")
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
