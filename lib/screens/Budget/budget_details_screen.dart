import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../constants/svgs.dart';
import '../../data/entries_data.dart';
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

class BudgetDetailsScreen extends StatefulWidget {
  const BudgetDetailsScreen({super.key});

  @override
  State<BudgetDetailsScreen> createState() => _BudgetDetailsScreenState();
}

class _BudgetDetailsScreenState extends State<BudgetDetailsScreen> {
  final List<Entry> _entries = budgetEntryList;

  Widget _buildEntryCards(BuildContext context, Entry entry) {
    return EntryCard(
      () => ShowModal.showModal(
        context,
        const EntryDetailsScreen(),
      ),
      sElectricity,
      cAmber.shade700,
      entry.description,
      100.00,
      "14/05/2023",
      entry.paid,
      entry.paid,
    );
  }

  @override
  Widget build(BuildContext context) {
    return FormContainer(
      "Detalhes do orçamento",
      Column(
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
                        sElectricity,
                        cAmber.shade700,
                        24,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 8.0),
                        child: SubtitleLabel("Energia elétrica"),
                      ),
                    ],
                  ),
                ),
                Column(
                  children: const <Widget>[
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: InputLabel("Disponível"),
                    ),
                    BudgetValueLabel(500.00, 880.00),
                    ProgresBarContainer(0.3),
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
                  SubtitleLabel("Lançamentos do mês"),
                ],
              ),
              SingleChildScrollView(
                child: _entries.isEmpty
                    ? const NoDataContainer("lançamento")
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
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          EditButton(() {}),
          DeleteButton("orçamento", () {}),
        ],
      ),
    );
  }
}
