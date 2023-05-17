import 'package:flutter/material.dart';

class ListTileLabel extends StatelessWidget {
  const ListTileLabel(this.description, {super.key});

  final String description;

  @override
  Widget build(BuildContext context) {
    return Text(
      description,
      style: Theme.of(context).textTheme.headlineLarge,
    );
  }
}
