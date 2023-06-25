import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../models/budget.dart';
import '../../models/entry.dart';
import '../../services/budget_service.dart';
import '../../services/entry_service.dart';
import '../../utils/calculate_value.dart';
import '../../utils/show_modal.dart';
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
  final List<Budget> _budgets = [];
  List<Entry> _entries = [];
  final List<Entry> _paidEntries = [];
  final List<Entry> _noPaidEntries = [];
  bool _isLoading = false;

  Future<List<Entry>> _fetchEntries() async {
    setState(() {
      _isLoading = true;
    });

    _paidEntries.clear();
    _noPaidEntries.clear();

    final entries = await EntryService.findAll();

    _paidEntries.addAll(
      entries.where((entry) => entry.paid == true),
    );

    _noPaidEntries.addAll(
      entries.where((entry) => entry.paid == false),
    );

    setState(() {
      _isLoading = false;
      _entries = entries;
    });

    return entries;
  }

  Future<Map<String, dynamic>> _fetchItemById(int id) async {
    setState(() {
      _isLoading = true;
    });

    final budget = await BudgetService.findById(widget.budget, id);
    await _fetchEntries();

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
    final updatedBudget = await BudgetService.put(
      context,
      budget,
      categoryId,
      description,
      value,
    );

    final index = _budgets.indexWhere(
      (budget) => budget.id == updatedBudget.id,
    );

    if (index != -1) {
      setState(() {
        _budgets[index] = updatedBudget;
      });
    }
  }

  _deleteBudget(int id) async {
    await BudgetService.delete(context, widget.budget, id);
  }

  void _updatePaymentStatus(Entry entry, bool paid) async {
    final updatedPaymentStatus = await EntryService.patch(
      entry,
      DateTime.now(),
      paid,
    );

    final index = _entries.indexWhere(
      (entry) => entry.id == updatedPaymentStatus.id,
    );

    if (index != -1) {
      setState(() {
        _entries[index] = updatedPaymentStatus;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchEntries();
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
      pathIcon: entry.category.pathIcon,
      backgroundColor: entry.category.backgroundColor,
      iconColor: entry.category.iconColor,
      description: entry.description,
      paidValue: entry.paidValue,
      dueDate: DateFormat("dd/MM/yyyy").format(entry.dueDate),
      paidDate: DateFormat("dd/MM/yyyy").format(entry.paidDate),
      paid: entry.paid,
      onPay: (paid) => _updatePaymentStatus(entry, paid),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FormContainer(
      title: "Detalhes do orçamento",
      bottonButton: Container(),
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
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              IconEditButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          EditBudgetFormScreen(
                                        budget: widget.budget,
                                        onSubmit: (
                                          budget,
                                          categoryId,
                                          description,
                                          value,
                                        ) =>
                                            _updateBudget(
                                          budget,
                                          categoryId,
                                          description,
                                          value,
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                              RoundedIconContainer(
                                pathIcon: widget.budget.category.pathIcon,
                                iconColor: widget.budget.category.iconColor,
                                backgroundColor:
                                    widget.budget.category.backgroundColor,
                                radius: 44,
                                heigth: 34,
                              ),
                              IconDeleteButton(
                                dataLabel: "orçamento",
                                onPressed: () {
                                  _deleteBudget(widget.budget.id);
                                  Navigator.pop(context);
                                },
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: SubtitleLabel(
                            label: widget.budget.category.description,
                          ),
                        ),
                        Column(
                          children: <Widget>[
                            const Padding(
                              padding: EdgeInsets.symmetric(vertical: 8.0),
                              child: InputLabel(label: "Utilizado"),
                            ),
                            BudgetValueLabel(
                              usedValue:
                                  calculateTotalValue(_entries, widget.budget),
                              budgetValue: widget.budget.value,
                            ),
                            ProgressBarContainer(
                              percentage:
                                  calculateTotalValue(_entries, widget.budget) /
                                      widget.budget.value *
                                      1,
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
                                    if (entry.category.id ==
                                        widget.budget.category.id) {
                                      if (index == _entries.length - 1) {
                                        return Padding(
                                          padding: const EdgeInsets.only(
                                            bottom: 120.0,
                                          ),
                                          child:
                                              _buildEntryCards(context, entry),
                                        );
                                      } else {
                                        return _buildEntryCards(context, entry);
                                      }
                                    }
                                    return Container();
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
