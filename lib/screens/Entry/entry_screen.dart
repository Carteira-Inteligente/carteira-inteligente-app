import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../constants/svgs.dart';
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
  final List<Entry> _entries = [];

  Widget _buildEntryCards(BuildContext context, Entry entry) {
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

    return EntryCard(
      onTap: () => ShowModal.showModal(
        context,
        const EntryDetailsScreen(),
      ),
      categoryIcon: _getCategoryIcon(entry.idCategory),
      categoryBackgroundColor: _getCategoryBackgroundColor(entry.idCategory),
      categoryIconColor: _getCategoryIconColor(entry.idCategory),
      title: entry.description,
      value: entry.paidValue,
      dueDate: "14/05/2023",
      paymentStatus: entry.paid,
      onPressedPayment: entry.paid,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        _entries.isEmpty
            ? const NoDataContainer(description: "lançamentos")
            : SizedBox(
                height: MediaQuery.of(context).size.height * 0.78,
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
