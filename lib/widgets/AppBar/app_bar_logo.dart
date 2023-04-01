import 'package:carteira_inteligente_app/constants/constants.dart';
import 'package:flutter/material.dart';

class AppBarLogo extends StatelessWidget {
  const AppBarLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Image.asset(
        iLinearLogo,
        alignment: Alignment.center,
      ),
    );
  }
}
