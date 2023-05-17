import 'package:flutter/material.dart';

class ModalTitleLabel extends StatelessWidget {
  const ModalTitleLabel({
    super.key,
    required this.label,
  });

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
