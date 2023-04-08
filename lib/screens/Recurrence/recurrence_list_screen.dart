import 'package:carteira_inteligente_app/models/recurrence.dart';
import 'package:carteira_inteligente_app/widgets/Cards/recurrence_card.dart';
import 'package:carteira_inteligente_app/widgets/Labels/modal_label.dart';
import 'package:flutter/material.dart';

class RecurrenceListScreen extends StatefulWidget {
  const RecurrenceListScreen({super.key});

  @override
  State<RecurrenceListScreen> createState() => _RecurrenceListScreenState();
}

class _RecurrenceListScreenState extends State<RecurrenceListScreen> {
  List<Recurrence> _recurrences = [
    Recurrence(
      id: 1,
      description: "Não repete",
    ),
    Recurrence(
      id: 2,
      description: "Diária",
    ),
    Recurrence(
      id: 3,
      description: "Semanal",
    ),
    Recurrence(
      id: 4,
      description: "Quinzenal",
    ),
    Recurrence(
      id: 5,
      description: "Mensal",
    ),
    Recurrence(
      id: 6,
      description: "Bimestral",
    ),
    Recurrence(
      id: 7,
      description: "Trimestral",
    ),
    Recurrence(
      id: 8,
      description: "Semestral",
    ),
    Recurrence(
      id: 9,
      description: "Anual",
    ),
  ];

  _buildRecurrenceCard(BuildContext context, Recurrence recurrence) {
    return RecurrenceCard(
      recurrence.description,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const ModalLabel("Selecionar recorrência"),
        SizedBox(
          height: 300,
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
                    const Divider(),
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
