import 'package:flutter/material.dart';

import '../../constants/colors.dart';

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
        style: TextStyle(
          fontFamily: "OpenSans",
          fontSize: 16,
          color: cBlue.shade800,
          fontWeight: FontWeight.normal,
        ),
      ),
    );
  }
}
