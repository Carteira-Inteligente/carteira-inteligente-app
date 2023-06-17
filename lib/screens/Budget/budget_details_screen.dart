import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import '../../models/budget.dart';
import '../../models/entry.dart';
import '../../routes/app_routes.dart';
import '../../services/budget_service.dart';
import '../../utils/show_modal.dart';
import '../../utils/toast_message.dart';
import '../../widgets/Buttons/delete_buttons.dart';
import '../../widgets/Buttons/edit_buttons.dart';
import '../../widgets/Cards/entry_card.dart';
import '../../widgets/Containers/divider_container.dart';
import '../../widgets/Containers/form_containers.dart';
import '../../widgets/Containers/no_data_containers.dart';
import '../../widgets/Containers/progress_containers.dart';
import '../../widgets/Containers/rounded_icon_container.dart';
import '../../widgets/Labels/budget_value_label.dart';
import '../../widgets/Labels/input_label.dart';
import '../../widgets/Labels/subtitle_label.dart';
import '../Entry/entry_details_screen.dart';
import 'edit_budget_form_screen.dart';

class BudgetDetailsScreen extends StatefulWidget {
  const BudgetDetailsScreen({
    super.key,
    required this.budget,
    required this.budgetId,
  });

  final Budget budget;
  final int budgetId;

  @override
  State<BudgetDetailsScreen> createState() => _BudgetDetailsScreenState();
}

class _BudgetDetailsScreenState extends State<BudgetDetailsScreen> {
  List<Budget> _budgets = [];
  List<Entry> _entries = [];
  bool _isLoading = false;

  Future<Map<String, dynamic>> _fetchItemById(int id) async {
    setState(() {
      _isLoading = true;
    });

    final budget = await BudgetService.findById(widget.budget, id);

    setState(() {
      _isLoading = false;
    });

    return budget;
  }

  _updateBudget(
    Budget budget,
    int categoryId,
    String description,
    double value,
  ) async {
    final response = await http.put(
      Uri.parse("${AppRoutes.budgetRoute}/${budget.id}"),
      body: json.encode({
        "user": {"id": 1},
        "category": {"id": categoryId},
        "description": description,
        "value": value,
      }),
      headers: {"Content-Type": "application/json"},
    );

    if (response.statusCode == 200) {
      final updatedBudget = Budget(
        id: budget.id,
        category: budget.category,
        description: description,
        value: value,
      );

      setState(() {
        _budgets = _budgets.map((budget) {
          if (budget.id == updatedBudget.id) {
            return updatedBudget;
          }
          return budget;
        }).toList();
      });

      ToastMessage.successToast("Orçamento atualizado com sucesso.");
      Navigator.pop(context);
    } else {
      ToastMessage.dangerToast("Falha ao atualizar o orçamento.");
    }
  }

  _deleteBudget(int id) async {
    await BudgetService.delete(context, widget.budget, id);
  }

  @override
  void initState() {
    super.initState();
    _fetchItemById(widget.budgetId);
  }

  Widget _buildEntryCards(BuildContext context, Entry entry) {
    return EntryCard(
      onTap: () => ShowModal.showModal(
        context,
        EntryDetailsScreen(
          entry: entry,
          entryId: entry.id,
        ),
      ),
      categoryIcon: entry.category.pathIcon,
      categoryBackgroundColor: entry.category.backgroundColor,
      categoryIconColor: entry.category.iconColor,
      title: entry.description,
      value: entry.paidValue,
      dueDate: "Tem que arrumar aqui",
      paymentStatus: entry.paid,
      onPressedPayment: entry.paid,
    );
  }

  @override
  Widget build(BuildContext context) {
    return FormContainer(
      title: "Detalhes do orçamento",
      bottonButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          EditButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => EditBudgetFormScreen(
                  budget: widget.budget,
                  onSubmit: (budget, categoryId, description, value) =>
                      _updateBudget(budget, categoryId, description, value),
                ),
              ),
            ),
          ),
          DeleteButton(
            dataLabel: "orçamento",
            onPressed: () {
              _deleteBudget(widget.budget.id);
              Navigator.pop(context);
            },
          ),
        ],
      ),
      child: _isLoading
          ? ProgressIndicatorContainer(visible: _isLoading)
          : RefreshIndicator(
              onRefresh: () => _fetchItemById(widget.budget.id),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 6.0),
                          child: Row(
                            children: <Widget>[
                              RoundedIconContainer(
                                svgPicture: widget.budget.category.pathIcon,
                                svgColor: widget.budget.category.iconColor,
                                backgroundColor:
                                    widget.budget.category.backgroundColor,
                                radius: 24,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: SubtitleLabel(
                                  label: widget.budget.category.description,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Column(
                          children: <Widget>[
                            const Padding(
                              padding: EdgeInsets.symmetric(vertical: 8.0),
                              child: InputLabel(label: "Utilizado"),
                            ),
                            BudgetValueLabel(
                              usedValue: 0,
                              budgetValue: widget.budget.value,
                            ),
                            ProgressBarContainer(
                              percentage: 0 / widget.budget.value * 1,
                            ),
                          ],
                        ),
                        const DividerContainer(),
                      ],
                    ),
                  ),
                  Column(
                    children: <Widget>[
                      Row(
                        children: const <Widget>[
                          SubtitleLabel(label: "Lançamentos do mês"),
                        ],
                      ),
                      SingleChildScrollView(
                        child: _entries.isEmpty
                            ? const NoEntryBudgetContainer()
                            : SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.67,
                                child: ListView.builder(
                                  itemCount: _entries.length,
                                  itemBuilder: (context, index) {
                                    final entry = _entries[index];
                                    if (index == _entries.length - 1) {
                                      return Padding(
                                        padding: const EdgeInsets.only(
                                          bottom: 120.0,
                                        ),
                                        child: _buildEntryCards(context, entry),
                                      );
                                    } else {
                                      return _buildEntryCards(context, entry);
                                    }
                                  },
                                ),
                              ),
                      ),
                    ],
                  )
                ],
              ),
            ),
    );
  }
}
