import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../constants/colors.dart';
import '../../constants/widgets.dart';
import '../Labels/input_label.dart';

class MonthNavigation extends StatelessWidget {
  const MonthNavigation({
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

class ActualMonthNavigation extends StatelessWidget {
  const ActualMonthNavigation({
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
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 5.0),
        decoration: BoxDecoration(
          borderRadius: wBorderRadius50,
          color: cBlue.shade50,
        ),
        child: Text(
          month.year == DateTime.now().year
              ? DateFormat("MMM", "pt-BR").format(month).toUpperCase()
              : DateFormat("MMM yy", "pt-BR").format(month).toUpperCase(),
          style: const TextStyle(
            fontSize: 16,
            color: cBlack,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
    );
  }
}
