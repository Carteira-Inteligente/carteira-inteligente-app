import 'package:carteira_inteligente/constants/constants.dart';
import 'package:carteira_inteligente/themes/light_status_bar_theme.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LightStatusBarTheme(
        Container(
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(iSplash),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
