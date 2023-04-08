import 'package:flutter/material.dart';

class RecurrenceCard extends StatelessWidget {
  const RecurrenceCard(this.description, {super.key});

  final String description;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        description,
        style: Theme.of(context).textTheme.displaySmall,
      ),
    );
  }
}
