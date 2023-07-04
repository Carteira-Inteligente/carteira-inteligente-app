import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class ButtonContainer extends StatelessWidget {
  const ButtonContainer({
    super.key,
    required this.child,
    this.paddingTop,
  });

  final Widget child;
  final bool? paddingTop;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: 8.0,
        top: paddingTop == false ? 0.0 : 8.0,
        left: 8.0,
        right: 8.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          child,
        ],
      ),
    );
  }
}

class BottomButtonContainer extends StatelessWidget {
  const BottomButtonContainer({
    super.key,
    required this.bottomButton,
  });

  final Widget bottomButton;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      child: Container(
        decoration: const BoxDecoration(color: cWhite),
        padding: const EdgeInsets.only(bottom: 15.0),
        child: bottomButton,
      ),
    );
  }
}
