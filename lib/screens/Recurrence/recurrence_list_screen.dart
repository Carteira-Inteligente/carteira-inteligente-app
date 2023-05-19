import 'package:flutter/material.dart';

import '../../data/recurrences_data.dart';
import '../../models/recurrence.dart';
import '../../widgets/Cards/recurrence_card.dart';
import '../../widgets/Containers/divider_container.dart';
import '../../widgets/Labels/modal_title_label.dart';

class RecurrenceListScreen extends StatefulWidget {
  const RecurrenceListScreen({
    super.key,
    required this.onRecurrenceSelected,
  });

  final void Function(String) onRecurrenceSelected;

  @override
  State<RecurrenceListScreen> createState() => _RecurrenceListScreenState();
}

class _RecurrenceListScreenState extends State<RecurrenceListScreen> {
  final List<Recurrence> _recurrences = recurrencesList;

  _buildRecurrenceCard(BuildContext context, Recurrence recurrence) {
    return Column(
      children: <Widget>[
        RecurrenceCard(
          onTap: () {
            widget.onRecurrenceSelected(recurrence.description);
            Navigator.pop(context);
          },
          description: recurrence.description,
        ),
        const DividerContainer(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const ModalTitleLabel(label: "Selecione a recorrência"),
        SizedBox(
          height: 450,
          child: ListView.builder(
            itemCount: _recurrences.length,
            itemBuilder: (context, index) {
              final recurrence = _recurrences[index];
              return _buildRecurrenceCard(context, recurrence);
            },
          ),
        ),
      ],
    );
  }
}
