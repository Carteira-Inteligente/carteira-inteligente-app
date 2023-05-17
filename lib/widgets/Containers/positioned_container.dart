import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class PositionedContainer extends StatelessWidget {
  const PositionedContainer({
    super.key,
    required this.bottonButton,
  });

  final Widget bottonButton;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      child: Container(
        decoration: const BoxDecoration(color: cWhite),
        padding: const EdgeInsets.only(bottom: 15.0),
        child: bottonButton,
      ),
    );
  }
}
