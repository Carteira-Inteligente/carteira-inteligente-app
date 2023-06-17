import 'package:flutter/material.dart';

import '../../models/budget.dart';
import '../../services/budget_service.dart';
import '../../widgets/Cards/budget_card.dart';
import '../../widgets/Containers/no_data_containers.dart';
import '../../widgets/Containers/progress_containers.dart';
import 'budget_details_screen.dart';

class BudgetScreen extends StatefulWidget {
  const BudgetScreen({super.key});

  @override
  State<BudgetScreen> createState() => _BudgetScreenState();
}

class _BudgetScreenState extends State<BudgetScreen> {
  List<Budget> _budgets = [];
  bool _isLoading = false;

  Future<List<Budget>> _fetchBudgets() async {
    setState(() {
      _isLoading = true;
    });

    final budgets = await BudgetService.findAll();

    setState(() {
      _isLoading = false;
      _budgets = budgets;
    });

    return budgets;
  }

  @override
  void initState() {
    super.initState();
    _fetchBudgets();
  }

  Widget _buildBudgetCards(BuildContext context, Budget budget, int index) {
    return BudgetCard(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => BudgetDetailsScreen(
            budget: budget,
            budgetId: budget.id,
          ),
        ),
      ),
      categoryIcon: budget.category.pathIcon,
      categoryBackgroundColor: budget.category.backgroundColor,
      categoryIconColor: budget.category.iconColor,
      description: budget.category.description,
      usedValue: 0,
      budgetValue: budget.value,
      percentage: 0 / budget.value * 1,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        _isLoading
            ? ProgressIndicatorContainer(
                visible: _isLoading,
              )
            : RefreshIndicator(
                onRefresh: _fetchBudgets,
                child: _budgets.isEmpty
                    ? const NoDataContainer(description: "orçamentos")
                    : SizedBox(
                        height: MediaQuery.of(context).size.height * 0.78,
                        child: ListView.builder(
                          itemCount: _budgets.length,
                          itemBuilder: (context, index) {
                            final budget = _budgets[index];
                            return _buildBudgetCards(context, budget, index);
                          },
                        ),
                      ),
              ),
      ],
    );
  }
}
