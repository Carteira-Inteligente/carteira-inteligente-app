import 'package:flutter/material.dart';

class Subtitle2Label extends StatelessWidget {
  const Subtitle2Label({
    super.key,
    this.padding,
    required this.label,
  });

  final String label;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        padding: padding,
        child: Text(
          label,
          style: Theme.of(context).textTheme.titleSmall,
        ),
      ),
    );
  }
}
