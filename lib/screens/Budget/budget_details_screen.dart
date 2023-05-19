import 'dart:math';

import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../constants/svgs.dart';
import '../../data/entries_data.dart';
import '../../models/budget.dart';
import '../../models/entry.dart';
import '../../utils/show_modal.dart';
import '../../widgets/Buttons/delete_button.dart';
import '../../widgets/Buttons/edit_button.dart';
import '../../widgets/Cards/entry_card.dart';
import '../../widgets/Containers/divider_container.dart';
import '../../widgets/Containers/form_container.dart';
import '../../widgets/Containers/no_data_container.dart';
import '../../widgets/Containers/progres_bar_container.dart';
import '../../widgets/Containers/rounded_icon_container.dart';
import '../../widgets/Labels/budget_value_label.dart';
import '../../widgets/Labels/input_label.dart';
import '../../widgets/Labels/subtitle_label.dart';
import '../Entry/entry_details_screen.dart';
import 'edit_budget_form_screen.dart';

class BudgetDetailsScreen extends StatefulWidget {
  const BudgetDetailsScreen({super.key});

  @override
  State<BudgetDetailsScreen> createState() => _BudgetDetailsScreenState();
}

class _BudgetDetailsScreenState extends State<BudgetDetailsScreen> {
  final List<Budget> _budgets = [];
  _editBudget(
    int idUser,
    int idCategory,
    double value,
  ) {
    final editBudget = Budget(
      id: Random().nextInt(999).toInt(),
      idUser: idUser,
      idCategory: idCategory,
      value: value,
    );

    setState(() {
      _budgets.add(editBudget);
    });

    Future.delayed(const Duration(milliseconds: 500), () {
      Navigator.of(context).pop();
    });
  }

  final List<Entry> _entries = budgetEntryList;

  Widget _buildEntryCards(BuildContext context, Entry entry) {
    return EntryCard(
      onTap: () => ShowModal.showModal(
        context,
        const EntryDetailsScreen(),
      ),
      categoryIcon: sElectricity,
      categoryColor: cAmber.shade700,
      title: entry.description,
      value: 100.00,
      dueDate: "14/05/2023",
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
        children: [
          EditButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      EditBudgetFormScreen(onSubmit: _editBudget),
                ),
              );
            },
          ),
          DeleteButton(
            dataLabel: "orçamento",
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6.0),
                  child: Row(
                    children: <Widget>[
                      RoundedIconContainer(
                        svgPicture: sElectricity,
                        backgroundColor: cAmber.shade700,
                        radius: 24,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 8.0),
                        child: SubtitleLabel(label: "Energia elétrica"),
                      ),
                    ],
                  ),
                ),
                Column(
                  children: const <Widget>[
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: InputLabel(label: "Disponível"),
                    ),
                    BudgetValueLabel(
                      usedValue: 500.00,
                      availableValue: 880.00,
                    ),
                    ProgresBarContainer(percentage: 0.3),
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
                    ? const NoDataContainer(description: "lançamento")
                    : SizedBox(
                        height: MediaQuery.of(context).size.height * 0.67,
                        child: ListView.builder(
                          itemCount: _entries.length,
                          itemBuilder: (context, index) {
                            final entry = _entries[index];

                            if (index == _entries.length - 1) {
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 120.0),
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
    );
  }
}
