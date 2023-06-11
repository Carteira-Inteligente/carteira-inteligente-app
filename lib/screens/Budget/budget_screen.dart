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
    String _getCategoryIcon(int idCategory) {
      if (idCategory == 1) {
        return sElectricity;
      } else if (idCategory == 2) {
        return sHouse;
      } else if (idCategory == 3) {
        return sCards;
      } else {
        return sMobile;
      }
    }

    Color _getCategoryBackgroundColor(int idCategory) {
      if (idCategory == 1) {
        return cAmber.shade100;
      } else if (idCategory == 2) {
        return cCyan.shade100;
      } else if (idCategory == 3) {
        return cBlueGrey.shade100;
      } else {
        return cTeal.shade100;
      }
    }

    Color _getCategoryIconColor(int idCategory) {
      if (idCategory == 1) {
        return cAmber.shade700;
      } else if (idCategory == 2) {
        return cCyan.shade700;
      } else if (idCategory == 3) {
        return cBlueGrey.shade700;
      } else {
        return cTeal.shade700;
      }
    }

    String _getCategoryDescription(int idCategory) {
      if (idCategory == 1) {
        return "Energia elétrica";
      } else if (idCategory == 2) {
        return "Casa";
      } else if (idCategory == 3) {
        return "Cartão de crédito";
      } else {
        return "Telefonia";
      }
    }

    return BudgetCard(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const BudgetDetailsScreen(),
          ),
        );
      },
      categoryIcon: _getCategoryIcon(budget.idCategory),
      categoryBackgroundColor: _getCategoryBackgroundColor(budget.idCategory),
      categoryIconColor: _getCategoryIconColor(budget.idCategory),
      description: _getCategoryDescription(budget.idCategory),
      value: budget.value,
      availableValue: budget.availableValue,
      percentage: budget.value / budget.availableValue * 1,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        _budgets.isEmpty
            ? const NoDataContainer(description: "orçamentos")
            : SizedBox(
                height: MediaQuery.of(context).size.height * 0.78,
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
