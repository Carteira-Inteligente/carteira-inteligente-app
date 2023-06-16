import 'package:flutter/material.dart';

class PeriodCard extends StatelessWidget {
  const PeriodCard({
    super.key,
    required this.onTap,
    required this.description,
  });

  final void Function() onTap;
  final String description;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      title: Text(
        description,
        style: Theme.of(context).textTheme.displaySmall,
      ),
    );
  }
}
