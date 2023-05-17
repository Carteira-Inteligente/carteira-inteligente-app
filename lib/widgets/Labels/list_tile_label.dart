import 'package:flutter/material.dart';

class ListTileLabel extends StatelessWidget {
  const ListTileLabel({
    super.key,
    required this.label,
  });

  final String label;

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: Theme.of(context).textTheme.headlineLarge,
    );
  }
}
