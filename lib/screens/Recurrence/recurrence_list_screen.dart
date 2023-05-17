import 'package:flutter/material.dart';

import '../../data/recurrences_data.dart';
import '../../models/recurrence.dart';
import '../../widgets/Cards/recurrence_card.dart';
import '../../widgets/Containers/divider_container.dart';
import '../../widgets/Labels/modal_title_label.dart';

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
