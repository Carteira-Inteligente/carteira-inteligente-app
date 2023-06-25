import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../models/entry.dart';
import '../../services/entry_service.dart';
import '../../utils/show_modal.dart';
import '../../widgets/Cards/entry_card.dart';
import '../../widgets/Containers/no_data_containers.dart';
import '../../widgets/Containers/progress_containers.dart';
import '../../widgets/Labels/payment_type_title_label.dart';
import 'entry_details_screen.dart';

class EntryScreen extends StatefulWidget {
  const EntryScreen({super.key});

  @override
  State<EntryScreen> createState() => _EntryScreenState();
}

class _EntryScreenState extends State<EntryScreen> {
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
      paid: entry.paid,
      onPay: (paid) => _updatePaymentStatus(entry, paid),
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
                            // sortByDate(_entries);
                            if (index == 0 && _noPaidEntries.isNotEmpty) {
                              return Column(
                                children: <Widget>[
                                  const PaymentTypeTitleLabel(
                                    label: "Aguardando pagamento",
                                  ),
                                  ..._noPaidEntries.map(
                                    (entry) => _buildEntryCards(context, entry),
                                  ),
                                ],
                              );
                            } else if (_paidEntries.isNotEmpty &&
                                index == _noPaidEntries.length) {
                              return Column(
                                children: <Widget>[
                                  const PaymentTypeTitleLabel(
                                    label: "Pagos",
                                  ),
                                  ..._paidEntries.map(
                                    (entry) => _buildEntryCards(context, entry),
                                  ),
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
