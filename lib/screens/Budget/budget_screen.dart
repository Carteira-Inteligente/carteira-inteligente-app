import 'package:flutter/material.dart';

import '../../models/budget.dart';
import '../../models/entry.dart';
import '../../services/budget_service.dart';
import '../../services/entry_service.dart';
import '../../utils/calculate_value.dart';
import '../../widgets/Cards/budget_card.dart';
import '../../widgets/Containers/progress_containers.dart';
import '../../widgets/Inputs/input_search.dart';
import 'budget_details_screen.dart';

class BudgetScreen extends StatefulWidget {
  const BudgetScreen({super.key});

  @override
  State<BudgetScreen> createState() => _BudgetScreenState();
}

class _BudgetScreenState extends State<BudgetScreen> {
  List<Budget> _budgets = [];
  List<Entry> _entries = [];
  bool _isLoading = false;
  String _searchQuery = "";

  Future<List<Budget>> _fetchBudgets() async {
    setState(() {
      _isLoading = true;
    });

    final budgets = await BudgetService.findAll();
    _entries = await EntryService.findAll();

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
      pathIcon: budget.category.pathIcon,
      backgroundColor: budget.category.backgroundColor,
      iconColor: budget.category.iconColor,
      description: budget.category.description,
      usedValue: calculateTotalValue(_entries, budget),
      value: budget.value,
      percentage: calculateTotalValue(_entries, budget) / budget.value * 1,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        InputSearch(
          onChanged: (value) {
            setState(() {
              _searchQuery = value;
            });
          },
        ),
        _isLoading
            ? ProgressIndicatorContainer(visible: _isLoading)
            : RefreshIndicator(
                onRefresh: _fetchBudgets,
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.7,
                  child: ListView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: _budgets.length,
                    itemBuilder: (context, index) {
                      final budget = _budgets[index];
                      final isMatch = budget.description
                          .toUpperCase()
                          .contains(_searchQuery.toUpperCase());

                      if (!isMatch) {
                        return Container();
                      }

                      return _buildBudgetCards(context, budget, index);
                    },
                  ),
                ),
              ),
      ],
    );
  }
}
