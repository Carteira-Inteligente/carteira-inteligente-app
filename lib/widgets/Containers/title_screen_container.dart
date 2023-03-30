import 'package:flutter/material.dart';

class TitleScreenContainer extends StatelessWidget {
  const TitleScreenContainer(this.title, {super.key});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        title,
        style: Theme.of(context).textTheme.bodyLarge,
      ),
    );
  }
}
