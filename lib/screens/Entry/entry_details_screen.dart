import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../constants/widgets.dart';
import '../../models/entry.dart';
import '../../routes/app_routes.dart';
import '../../services/entry_service.dart';
import '../../utils/format_currency.dart';
import '../../utils/toast_message.dart';
import '../../widgets/Buttons/delete_buttons.dart';
import '../../widgets/Buttons/edit_buttons.dart';
import '../../widgets/Containers/divider_container.dart';
import '../../widgets/Containers/rounded_icon_container.dart';
import '../../widgets/Labels/entry_details_label.dart';
import '../../widgets/Labels/modal_title_label.dart';
import '../../widgets/Labels/subtitle2_label.dart';
import '../../widgets/Labels/subtitle_label.dart';
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
  List<Entry> _entries = [];

  Future<Map<String, dynamic>> _fetchItemById(int id) async {
    final entry = await EntryService.findById(widget.entry, id);
    return entry;
  }

  _updateEntry(
    Entry entry,
    bool paid,
    String description,
    int categoryId,
    String period,
    int paymentTypeId,
    double paidValue,
    DateTime dueDate,
    DateTime paidDate,
  ) async {
    final response = await http.put(
      Uri.parse("${AppRoutes.entryRoute}/${entry.id}"),
      body: json.encode({
        "user": {"id": 1},
        "paid": paid,
        "description": description,
        "category": {"id": categoryId},
        "period": period,
        "paymentType": {"id": paymentTypeId},
        "paidValue": paidValue,
        "dueDate": dueDate.toIso8601String(),
        "paidDate": paidDate.toIso8601String(),
      }),
      headers: {"Content-Type": "application/json"},
    );

    if (response.statusCode == 200) {
      final updatedEntry = Entry(
        id: entry.id,
        paid: paid,
        description: description,
        category: entry.category,
        period: period,
        paymentType: entry.paymentType,
        paidValue: paidValue,
        dueDate: dueDate,
        paidDate: paidDate,
      );

      setState(() {
        _entries = _entries.map((entry) {
          if (entry.id == updatedEntry.id) {
            return updatedEntry;
          }
          return entry;
        }).toList();
      });

      ToastMessage.successToast("Lançamento atualizado com sucesso.");
      Navigator.pop(context);
    } else {
      ToastMessage.dangerToast("Falha ao atualizar lançamento.");
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
        const ModalTitleLabel(label: "Detalhes do lançamento"),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: SubtitleLabel(label: widget.entry.description),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  IconEditButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EditEntryFormScreen(
                            entry: widget.entry,
                            onSubmit: (
                              entry,
                              paid,
                              description,
                              categoryId,
                              period,
                              paymentTypeId,
                              paidValue,
                              dueDate,
                              paidDate,
                            ) =>
                                _updateEntry(
                              entry,
                              paid,
                              description,
                              categoryId,
                              period,
                              paymentTypeId,
                              paidValue,
                              dueDate,
                              paidDate,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      borderRadius: wBorderRadius50,
                    ),
                    child: RoundedIconContainer(
                      svgPicture: widget.entry.category.pathIcon,
                      svgColor: widget.entry.category.iconColor,
                      backgroundColor: widget.entry.category.backgroundColor,
                      radius: 34,
                      heigth: 34,
                    ),
                  ),
                  IconDeleteButton(
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
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                decoration: BoxDecoration(
                  borderRadius: wBorderRadius50,
                  border: Border.all(color: cGrey.shade600),
                ),
                child: Subtitle2Label(
                  label: formatCurrency.format(widget.entry.paidValue),
                ),
              ),
              const DividerContainer(),
              Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: EntryDetailsLabel(
                      label: "Status de pagamento",
                      details: widget.entry.paid == true ? "Pago" : "Em aberto",
                    ),
                  ),
                  const Expanded(
                    flex: 1,
                    child: EntryDetailsLabel(
                      label: "Data de vencimento",
                      details: "Tem que arrumar aqui",
                    ),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: EntryDetailsLabel(
                      label: "Recorrência",
                      details: widget.entry.period,
                    ),
                  ),
                  const Expanded(
                    flex: 1,
                    child: EntryDetailsLabel(
                      label: "Data de pagamento",
                      details: "Tem que arrumar aqui",
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
