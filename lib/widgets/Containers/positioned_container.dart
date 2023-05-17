import 'package:carteira_inteligente/constants/colors.dart';
import 'package:carteira_inteligente/constants/widgets.dart';
import 'package:flutter/material.dart';

class PositionedContainer extends StatelessWidget {
  const PositionedContainer(this.bottonButton, {super.key});

  final Widget bottonButton;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      child: Container(
        height: 100,
        decoration: const BoxDecoration(color: cWhite),
        padding: const EdgeInsets.only(bottom: 15.0),
        child: bottonButton,
      ),
    );
  }
}
