import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../constants/svgs.dart';
import '../../data/entries_data.dart';
import '../../models/entry.dart';
import '../../utils/format_currency.dart';
import '../../utils/show_modal.dart';
import '../../widgets/Cards/entry_card.dart';
import '../../widgets/Containers/no_data_container.dart';
import 'entry_details_screen.dart';

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
