import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../constants/colors.dart';
import '../../constants/svgs.dart';
import '../../constants/widgets.dart';
import '../../models/entry.dart';
import '../../widgets/Buttons/delete_buttons.dart';
import '../../widgets/Buttons/edit_buttons.dart';
import '../../widgets/Containers/divider_container.dart';
import '../../widgets/Labels/entry_details_label.dart';
import '../../widgets/Labels/modal_title_label.dart';
import '../../widgets/Labels/subtitle2_label.dart';
import '../../widgets/Labels/subtitle_label.dart';
import 'edit_entry_form_screen.dart';

class EntryDetailsScreen extends StatefulWidget {
  const EntryDetailsScreen({super.key});

  @override
  State<EntryDetailsScreen> createState() => _EntryDetailsScreenState();
}

class _EntryDetailsScreenState extends State<EntryDetailsScreen> {
  final List<Entry> _entries = [];
  _editEntry(
    int idUser,
    int idCategory,
    String description,
    String period,
    double paidValue,
    DateTime paidDate,
    bool paid,
    DateTime dueDate,
  ) {
    final editEntry = Entry(
      id: Random().nextInt(999).toInt(),
      idUser: idUser,
      idCategory: idCategory,
      description: description,
      period: period,
      paidValue: paidValue,
      paidDate: paidDate,
      paid: paid,
      dueDate: dueDate,
    );

    setState(() {
      _entries.add(editEntry);
    });

    Future.delayed(const Duration(milliseconds: 500), () {
      Navigator.of(context).pop();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const ModalTitleLabel(label: "Detalhes do lançamento"),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(bottom: 8.0),
                child: SubtitleLabel(label: "Conta de luz"),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  IconEditButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              EditEntryFormScreen(onSubmit: _editEntry),
                        ),
                      );
                    },
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      borderRadius: wBorderRadius50,
                    ),
                    child: CircleAvatar(
                      backgroundColor: cAmber.shade100,
                      radius: 34,
                      child: Container(
                        padding: const EdgeInsets.all(6.0),
                        child: SvgPicture.asset(
                          sElectricity,
                          color: cAmber.shade700,
                          height: 34,
                        ),
                      ),
                    ),
                  ),
                  IconDeleteButton(
                    dataLabel: "lançamento",
                    onPressed: () => Navigator.pop(context),
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
                child: const Subtitle2Label(label: "R\$ 123,45"),
              ),
              const DividerContainer(),
              Row(
                children: const <Widget>[
                  Expanded(
                    flex: 1,
                    child: EntryDetailsLabel(
                      label: "Status de pagamento",
                      details: "Pago",
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: EntryDetailsLabel(
                      label: "Data de vencimento",
                      details: "01/04/2023",
                    ),
                  ),
                ],
              ),
              Row(
                children: const <Widget>[
                  Expanded(
                    flex: 1,
                    child: EntryDetailsLabel(
                      label: "Recorrência",
                      details: "Mensal",
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: EntryDetailsLabel(
                      label: "Data de pagamento",
                      details: "01/04/2023",
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
