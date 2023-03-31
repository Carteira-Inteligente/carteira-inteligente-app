import 'package:flutter/material.dart';

class SubtitleLabel extends StatelessWidget {
  const SubtitleLabel(this.subtitle, {super.key});

  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        subtitle,
        style: Theme.of(context).textTheme.headlineMedium,
      ),
    );
  }
}
