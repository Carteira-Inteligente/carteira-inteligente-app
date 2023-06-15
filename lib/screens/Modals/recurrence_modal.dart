import 'package:flutter/material.dart';

import '../../data/recurrences_data.dart';
import '../../models/recurrence.dart';
import '../../widgets/Cards/recurrence_card.dart';
import '../../widgets/Containers/divider_container.dart';
import '../../widgets/Labels/modal_title_label.dart';

class RecurrenceModal extends StatefulWidget {
  const RecurrenceModal({
    super.key,
    required this.onSelected,
  });

  final void Function(String, int) onSelected;

  @override
  State<RecurrenceModal> createState() => _RecurrenceModalState();
}

class _RecurrenceModalState extends State<RecurrenceModal> {
  final List<Recurrence> _recurrences = recurrencesList;

  _buildRecurrenceCard(BuildContext context, Recurrence recurrence) {
    return Column(
      children: <Widget>[
        RecurrenceCard(
          onTap: () {
            widget.onSelected(recurrence.description, recurrence.id);
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
          height: MediaQuery.of(context).size.height * 0.5,
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
