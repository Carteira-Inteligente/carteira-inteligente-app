import 'package:carteira_inteligente/constants/colors.dart';
import 'package:flutter/material.dart';

class ProgresBarContainer extends StatelessWidget {
  const ProgresBarContainer(this.percentage, {super.key});

  final double percentage;

  @override
  Widget build(BuildContext context) {
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
              widthFactor: percentage,
              child: Container(
                decoration: BoxDecoration(
                  color: cGreen,
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
