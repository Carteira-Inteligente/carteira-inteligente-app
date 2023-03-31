import 'package:flutter/material.dart';

class ButtonContainer extends StatelessWidget {
  const ButtonContainer(this.widget, {super.key});

  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          widget,
        ],
      ),
    );
  }
}
