import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../constants/svgs.dart';
import 'buttons_navigation.dart';
import 'month_navigation.dart';

class MonthTabNavigation extends StatelessWidget {
  const MonthTabNavigation({
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
          MonthNavigation(
            onPressed: onPressedPrevious,
            month: previousMonth,
          ),
          ActualMonthNavigation(
            onPressed: onPressedMonth,
            month: selectedMonth,
          ),
          MonthNavigation(
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
