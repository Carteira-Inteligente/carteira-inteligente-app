import 'package:flutter/material.dart';

class TitleLabel extends StatelessWidget {
  const TitleLabel({
    super.key,
    required this.label,
  });

  final String label;

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: Theme.of(context).textTheme.titleLarge,
    );
  }
}
