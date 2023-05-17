import 'package:carteira_inteligente/constants/widgets.dart';
import 'package:carteira_inteligente/data/recurrences_data.dart';
import 'package:carteira_inteligente/models/recurrence.dart';
import 'package:carteira_inteligente/widgets/Cards/recurrence_card.dart';
import 'package:carteira_inteligente/widgets/Containers/divider_container.dart';
import 'package:carteira_inteligente/widgets/Labels/modal_title_label.dart';
import 'package:flutter/material.dart';

class RecurrenceListScreen extends StatefulWidget {
  const RecurrenceListScreen(this.onCategoryRecurrence, {super.key});

  final void Function(String) onCategoryRecurrence;

  @override
  State<RecurrenceListScreen> createState() => _RecurrenceListScreenState();
}

class _RecurrenceListScreenState extends State<RecurrenceListScreen> {
  final List<Recurrence> _recurrences = recurrencesList;

  _buildRecurrenceCard(BuildContext context, Recurrence recurrence) {
    return RecurrenceCard(
      () {
        widget.onCategoryRecurrence(recurrence.description);
        Navigator.pop(context);
      },
      recurrence.description,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const ModalTitleLabel("Selecionar recorrência"),
        SizedBox(
          height: 450,
          child: ListView.builder(
            itemCount: _recurrences.length,
            itemBuilder: (context, index) {
              final recurrence = _recurrences[index];

              if (index == _recurrences.length - 1) {
                return _buildRecurrenceCard(context, recurrence);
              } else {
                return Column(
                  children: <Widget>[
                    _buildRecurrenceCard(context, recurrence),
                    const DividerContainer(),
                  ],
                );
              }
            },
          ),
        ),
      ],
    );
  }
}
