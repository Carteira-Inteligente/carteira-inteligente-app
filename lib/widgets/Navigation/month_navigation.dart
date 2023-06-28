import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../constants/svgs.dart';
import 'button_navigation.dart';
import 'label_navigation.dart';

class MonthNavigation extends StatelessWidget {
  const MonthNavigation({
    super.key,
    required this.onPressedPrevious,
    required this.onPressedNext,
    required this.onPressedMonth,
    required this.previousMonth,
    required this.selectedMonth,
    required this.nextMonth,
  });

  final void Function() onPressedPrevious;
  final void Function() onPressedNext;
  final void Function() onPressedMonth;
  final DateTime selectedMonth;
  final DateTime previousMonth;
  final DateTime nextMonth;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: cGrey.shade200),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          ButtonNavigation(
            onPressed: onPressedPrevious,
            svgIcon: sArrowLeft,
          ),
          LabelNavigation(
            onPressed: onPressedPrevious,
            month: previousMonth,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: cBlue.shade800,
                  width: 1.5,
                ),
              ),
            ),
            child: LabelNavigation(
              onPressed: onPressedMonth,
              month: selectedMonth,
            ),
          ),
          LabelNavigation(
            onPressed: onPressedNext,
            month: nextMonth,
          ),
          ButtonNavigation(
            onPressed: onPressedNext,
            svgIcon: sArrowRight,
          ),
        ],
      ),
    );
  }
}
