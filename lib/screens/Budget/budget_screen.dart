import 'package:carteira_inteligente/constants/constants.dart';
import 'package:carteira_inteligente/models/budget.dart';
import 'package:carteira_inteligente/screens/Budget/budget_details_screen.dart';
import 'package:carteira_inteligente/utils/format_currency.dart';
import 'package:carteira_inteligente/widgets/Cards/budget_card.dart';
import 'package:carteira_inteligente/widgets/Containers/category_icon_container.dart';
import 'package:carteira_inteligente/widgets/Containers/no_data_container.dart';
import 'package:flutter/material.dart';

class BudgetScreen extends StatefulWidget {
  const BudgetScreen({super.key});

  @override
  State<BudgetScreen> createState() => _BudgetScreenState();
}

class _BudgetScreenState extends State<BudgetScreen> {
  var formatCurrency = getFormatCurrency();

  final List<Budget> _budgets = [
    Budget(
      id: 1,
      idUser: 1,
      idCategory: 1,
      value: 123.45,
    ),
    Budget(
      id: 2,
      idUser: 1,
      idCategory: 2,
      value: 542.33,
    ),
    Budget(
      id: 1,
      idUser: 1,
      idCategory: 1,
      value: 123.45,
    ),
    Budget(
      id: 2,
      idUser: 1,
      idCategory: 2,
      value: 542.33,
    ),
    Budget(
      id: 1,
      idUser: 1,
      idCategory: 1,
      value: 123.45,
    ),
    Budget(
      id: 2,
      idUser: 1,
      idCategory: 2,
      value: 542.33,
    ),
    Budget(
      id: 1,
      idUser: 1,
      idCategory: 1,
      value: 123.45,
    ),
    Budget(
      id: 2,
      idUser: 1,
      idCategory: 2,
      value: 542.33,
    ),
    Budget(
      id: 1,
      idUser: 1,
      idCategory: 1,
      value: 123.45,
    ),
    Budget(
      id: 2,
      idUser: 1,
      idCategory: 2,
      value: 542.33,
    ),
    Budget(
      id: 1,
      idUser: 1,
      idCategory: 1,
      value: 123.45,
    ),
    Budget(
      id: 2,
      idUser: 1,
      idCategory: 2,
      value: 542.33,
    ),
  ];

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
          ? CategoryIconContainer(
              sElectricity,
              cAmber.shade700,
              14,
            )
          : CategoryIconContainer(
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

                    if (index == _budgets.length - 1) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 35.0),
                        child: _buildBudgetCards(context, budget),
                      );
                    } else {
                      return _buildBudgetCards(context, budget);
                    }
                  },
                ),
              ),
      ],
    );
  }
}
