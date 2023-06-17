import 'package:flutter/material.dart';

import '../../models/entry.dart';
import '../../services/entry_service.dart';
import '../../utils/show_modal.dart';
import '../../widgets/Cards/entry_card.dart';
import '../../widgets/Containers/no_data_containers.dart';
import '../../widgets/Containers/progress_containers.dart';
import 'entry_details_screen.dart';

class EntryScreen extends StatefulWidget {
  const EntryScreen({super.key});

  @override
  State<EntryScreen> createState() => _EntryScreenState();
}

class _EntryScreenState extends State<EntryScreen> {
  List<Entry> _entries = [];
  bool _isLoading = false;

  Future<List<Entry>> _fetchEntries() async {
    setState(() {
      _isLoading = true;
    });

    final entries = await EntryService.findAll();

    setState(() {
      _isLoading = false;
      _entries = entries;
    });

    return entries;
  }

  @override
  void initState() {
    super.initState();
    _fetchEntries();
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
    return Column(
      children: <Widget>[
        _isLoading
            ? ProgressIndicatorContainer(
                visible: _isLoading,
              )
            : RefreshIndicator(
                onRefresh: _fetchEntries,
                child: _entries.isEmpty
                    ? const NoEntryContainer()
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
              ),
      ],
    );
  }
}
