import 'package:carteira_inteligente/constants/constants.dart';
import 'package:flutter/material.dart';

class AppBarLogo extends StatelessWidget {
  const AppBarLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      child: Image.asset(
        iLinearWhiteLogo,
        alignment: Alignment.center,
      ),
    );
  }
}
