import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class ProgressBarContainer extends StatelessWidget {
  const ProgressBarContainer({
    super.key,
    required this.percentage,
  });

  final double percentage;

  @override
  Widget build(BuildContext context) {
    final clampedPercentage = percentage.clamp(0.0, 1.0);

    Color percentageColor() {
      if (percentage < 0.80) {
        return cGreen;
      } else if (percentage >= 0.80 && percentage <= 0.99) {
        return cYellow.shade700;
      } else {
        return cRed;
      }
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: SizedBox(
        height: 10,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          alignment: Alignment.centerLeft,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                color: cGrey.shade300,
                borderRadius: BorderRadius.circular(50),
              ),
            ),
            FractionallySizedBox(
              widthFactor: clampedPercentage,
              child: Container(
                decoration: BoxDecoration(
                  color: percentageColor(),
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProgressIndicatorContainer extends StatelessWidget {
  const ProgressIndicatorContainer({
    super.key,
    required this.visible,
  });

  final bool visible;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: visible,
      child: const Center(child: CircularProgressIndicator.adaptive()),
    );
  }
}
