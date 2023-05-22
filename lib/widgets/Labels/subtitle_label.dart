import 'package:flutter/material.dart';

class SubtitleLabel extends StatelessWidget {
  const SubtitleLabel({
    super.key,
    required this.label,
    this.padding,
  });

  final String label;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      child: Text(
        label,
        style: Theme.of(context).textTheme.titleMedium,
      ),
    );
  }
}
