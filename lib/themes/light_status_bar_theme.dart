import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LightStatusBarTheme extends StatelessWidget {
  const LightStatusBarTheme(this.widget, {super.key});

  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: widget,
    );
  }
}
