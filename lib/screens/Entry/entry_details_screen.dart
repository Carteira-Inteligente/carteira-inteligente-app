import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../constants/colors.dart';
import '../../constants/widgets.dart';
import '../../data/period_data.dart';
import '../../models/entry.dart';
import '../../services/entry_service.dart';
import '../../utils/format_currency.dart';
import '../../widgets/Buttons/delete_button.dart';
import '../../widgets/Buttons/edit_button.dart';
import '../../widgets/Containers/divider_container.dart';
import '../../widgets/Containers/rounded_icon_container.dart';
import '../../widgets/Labels/details_label.dart';
import '../../widgets/Labels/subtitle_labels.dart';
import '../../widgets/Labels/title_labels.dart';
import 'edit_entry_form_screen.dart';

class EntryDetailsScreen extends StatefulWidget {
  const EntryDetailsScreen({
    super.key,
    required this.entry,
    required this.entryId,
  });

  final Entry entry;
  final int entryId;

  @override
  State<EntryDetailsScreen> createState() => _EntryDetailsScreenState();
}

class _EntryDetailsScreenState extends State<EntryDetailsScreen> {
  final List<Entry> _entries = [];

  Future<Map<String, dynamic>> _fetchItemById(int id) async {
    final entry = await EntryService.findById(widget.entry, id);
    return entry;
  }

  _updateEntry(
    Entry entry,
    int categoryId,
    int paymentTypeId,
    String description,
    String period,
    double paidValue,
    DateTime paidDate,
    bool paid,
    DateTime dueDate,
  ) async {
    final updatedEntry = await EntryService.put(
      context,
      entry,
      categoryId,
      paymentTypeId,
      description,
      period,
      paidValue,
      paidDate,
      paid,
      dueDate,
    );

    final index = _entries.indexWhere(
      (entry) => entry.id == updatedEntry.id,
    );

    if (index != -1) {
      setState(() {
        _entries[index] = updatedEntry;
      });
    }
  }

  _deleteEntry(int id) async {
    await EntryService.delete(context, widget.entry, id);
  }

  @override
  void initState() {
    super.initState();
    _fetchItemById(widget.entryId);
  }

  @override
  Widget build(BuildContext context) {
    final formatCurrency = getFormatCurrency();
    return Column(
      children: <Widget>[
        Stack(
          children: <Widget>[
            const Align(
              alignment: Alignment.center,
              child: ModalTitleLabel(label: "Detalhes do lançamento"),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: IconButton(
                padding: const EdgeInsets.only(bottom: 24.0),
                onPressed: () => Navigator.pop(context),
                icon: Icon(
                  Icons.close,
                  color: cGrey.shade600,
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  EditButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EditEntryFormScreen(
                            entry: widget.entry,
                            onSubmit: (
                              entry,
                              categoryId,
                              paymentTypeId,
                              description,
                              period,
                              paidValue,
                              paidDate,
                              paid,
                              dueDate,
                            ) =>
                                _updateEntry(
                              entry,
                              categoryId,
                              paymentTypeId,
                              description,
                              period,
                              paidValue,
                              dueDate,
                              paid,
                              paidDate,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  SizedBox(
                    child: RoundedIconContainer(
                      pathIcon: widget.entry.category.pathIcon,
                      iconColor: widget.entry.category.iconColor,
                      backgroundColor: widget.entry.category.backgroundColor,
                      radius: 44,
                      heigth: 34,
                    ),
                  ),
                  DeleteButton(
                    dataLabel: "lançamento",
                    onPressed: () {
                      _deleteEntry(widget.entry.id);
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 30.0),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: BoldSubtitleLabel(label: widget.entry.description),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                decoration: BoxDecoration(
                  borderRadius: wBorderRadius50,
                  border: Border.all(color: cGrey.shade600),
                ),
                child: SubtitleLabel(
                  label: formatCurrency.format(widget.entry.paidValue),
                ),
              ),
              const DividerContainer(),
              Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: DetailsLabel(
                      label: "Data de vencimento",
                      details: DateFormat("dd/MM/yyyy").format(
                        widget.entry.dueDate,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: DetailsLabel(
                      label: "Status de pagamento",
                      details: widget.entry.paid == true
                          ? "Pago em: ${DateFormat("dd/MM/yyyy").format(
                              widget.entry.paidDate,
                            )}"
                          : "Em aberto",
                    ),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: DetailsLabel(
                      label: "Recorrência",
                      details: buildPeriodDescription(widget.entry.period),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: DetailsLabel(
                      label: "Forma de pagamento",
                      details: widget.entry.paymentType.description,
                    ),
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
