import 'package:flutter/material.dart';

class ModalTitleLabel extends StatelessWidget {
  const ModalTitleLabel(this.label, {super.key});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(
        label,
        style: Theme.of(context).textTheme.displaySmall,
      ),
    );
  }
}
