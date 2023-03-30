import 'package:flutter/material.dart';

class SubtitleScreenContainer extends StatelessWidget {
  const SubtitleScreenContainer(this.subtitle, {super.key});

  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Text(
        subtitle,
        style: Theme.of(context).textTheme.headlineMedium,
      ),
    );
  }
}
