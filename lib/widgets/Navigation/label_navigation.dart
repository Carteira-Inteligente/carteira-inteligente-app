import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../Labels/input_label.dart';

class LabelNavigation extends StatelessWidget {
  const LabelNavigation({
    super.key,
    required this.onPressed,
    required this.month,
  });

  final void Function() onPressed;
  final DateTime month;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: InputLabel(
        label: month.year == DateTime.now().year
            ? DateFormat("MMM", "pt-BR").format(month).toUpperCase()
            : DateFormat("MMM yy", "pt-BR").format(month).toUpperCase(),
      ),
    );
  }
}
