import 'package:carteira_inteligente_app/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DarkStatusBarTheme extends StatelessWidget {
  const DarkStatusBarTheme(this.widget, {super.key});

  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: cBlack,
        statusBarBrightness: Brightness.light,
      ),
      child: widget,
    );
  }
}
