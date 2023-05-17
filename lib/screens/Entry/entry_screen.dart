import 'package:carteira_inteligente/constants/colors.dart';
import 'package:carteira_inteligente/constants/svgs.dart';
import 'package:carteira_inteligente/data/entries_data.dart';
import 'package:carteira_inteligente/screens/Entry/entry_details_screen.dart';
import 'package:carteira_inteligente/utils/format_currency.dart';
import 'package:carteira_inteligente/utils/show_modal.dart';
import 'package:carteira_inteligente/widgets/Cards/entry_card.dart';
import 'package:carteira_inteligente/widgets/Containers/no_data_container.dart';
import 'package:carteira_inteligente/models/entry.dart';
import 'package:flutter/material.dart';

class EntryScreen extends StatefulWidget {
  const EntryScreen({super.key});

  @override
  State<EntryScreen> createState() => _EntryScreenState();
}

class _EntryScreenState extends State<EntryScreen> {
  var formatCurrency = getFormatCurrency();
  final List<Entry> _entries = entryList;

  Widget _buildEntryCards(BuildContext context, Entry entry) {
    return EntryCard(
      () => ShowModal.showModal(
        context,
        const EntryDetailsScreen(),
      ),
      entry.idCategory == 1 ? sElectricity : sHouse,
      entry.idCategory == 1 ? cAmber.shade700 : cCyan.shade700,
      entry.description,
      100.00,
      "14/05/2023",
      entry.paid,
      entry.paid,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        _entries.isEmpty
            ? const NoDataContainer("lançamentos")
            : SizedBox(
                height: MediaQuery.of(context).size.height * 0.71,
                child: ListView.builder(
                  itemCount: _entries.length,
                  itemBuilder: (context, index) {
                    final entry = _entries[index];
                    return _buildEntryCards(context, entry);
                  },
                ),
              ),
      ],
    );
  }
}
