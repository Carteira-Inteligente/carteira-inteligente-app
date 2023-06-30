import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../models/entry.dart';
import '../../services/entry_service.dart';
import '../../utils/show_modal.dart';
import '../../widgets/Cards/entry_card.dart';
import '../../widgets/Containers/progress_containers.dart';
import '../../widgets/Inputs/input_search.dart';
import '../../widgets/Labels/subtitle_labels.dart';
import '../../widgets/Navigation/month_navigation.dart';
import 'entry_details_screen.dart';

class EntryScreen extends StatefulWidget {
  const EntryScreen({super.key});

  @override
  State<EntryScreen> createState() => _EntryScreenState();
}

class _EntryScreenState extends State<EntryScreen> {
  DateTime _selectedMonth = DateTime.now();
  DateTime _previousMonth = DateTime.now();
  DateTime _nextMonth = DateTime.now();
  List<Entry> _entries = [];
  final List<Entry> _paidEntries = [];
  final List<Entry> _noPaidEntries = [];
  bool _isLoading = false;
  String _searchQuery = "";

  List<Entry> _filterEntriesByMonth(List<Entry> entries) {
    return _entries
        .where(
          (entry) =>
              entry.dueDate.month == _selectedMonth.month &&
              entry.dueDate.year == _selectedMonth.year,
        )
        .toList();
  }

  Future<List<Entry>> _fetchEntries() async {
    setState(() {
      _isLoading = true;
    });

    _paidEntries.clear();
    _noPaidEntries.clear();

    final entries = await EntryService.findAll();
    final filteredEntries = _filterEntriesByMonth(entries);

    _paidEntries.addAll(
      filteredEntries.where((entry) => entry.paid == true),
    );

    _noPaidEntries.addAll(
      filteredEntries.where((entry) => entry.paid == false),
    );

    setState(() {
      _isLoading = false;
      _entries = entries;
    });

    return entries;
  }

  void _updatePaymentStatus(Entry entry, bool paid) async {
    final updatedPaymentStatus = await EntryService.patch(
      entry,
      DateTime.now(),
      paid,
    );

    _fetchEntries();

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
    _filterEntriesByMonth(_entries);
    return Column(
      children: <Widget>[
        MonthNavigation(
          onPressedPrevious: () {
            setState(() {
              _selectedMonth = DateTime(
                _selectedMonth.year,
                _selectedMonth.month - 1,
                _selectedMonth.day,
              );
            });
            _fetchEntries();
          },
          onPressedNext: () {
            setState(() {
              _selectedMonth = DateTime(
                _selectedMonth.year,
                _selectedMonth.month + 1,
                _selectedMonth.day,
              );
            });
            _fetchEntries();
          },
          previousMonth: _previousMonth = DateTime(
            _selectedMonth.year,
            _selectedMonth.month - 1,
            _selectedMonth.day,
          ),
          selectedMonth: _selectedMonth,
          onPressedMonth: () {
            setState(() {
              _selectedMonth = DateTime.now();
            });
            _fetchEntries();
          },
          nextMonth: _nextMonth = DateTime(
            _selectedMonth.year,
            _selectedMonth.month + 1,
            _selectedMonth.day,
          ),
        ),
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
                onRefresh: _fetchEntries,
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.645,
                  child: ListView.builder(
                    itemCount: _entries.length,
                    itemBuilder: (context, index) {
                      if (index == 0 && _noPaidEntries.isNotEmpty) {
                        return Column(
                          children: <Widget>[
                            const SubtitleListLabel(
                              label: "Aguardando pagamento",
                            ),
                            ..._noPaidEntries
                                .where((entry) =>
                                    entry.description
                                        .toUpperCase()
                                        .contains(_searchQuery.toUpperCase()) ||
                                    entry.category.description
                                        .toUpperCase()
                                        .contains(_searchQuery.toUpperCase()))
                                .map(
                                    (entry) => _buildEntryCards(context, entry))
                                .toList(),
                          ],
                        );
                      } else if (_paidEntries.isNotEmpty &&
                          index == _noPaidEntries.length) {
                        return Column(
                          children: <Widget>[
                            const SubtitleListLabel(
                              label: "Pagos",
                            ),
                            ..._paidEntries
                                .where((entry) =>
                                    entry.description
                                        .toUpperCase()
                                        .contains(_searchQuery.toUpperCase()) ||
                                    entry.category.description
                                        .toUpperCase()
                                        .contains(_searchQuery.toUpperCase()))
                                .map(
                                    (entry) => _buildEntryCards(context, entry))
                                .toList(),
                          ],
                        );
                      }
                      return Container();
                    },
                  ),
                ),
              ),
      ],
    );
  }
}
