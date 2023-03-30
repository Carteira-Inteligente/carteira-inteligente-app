import 'package:flutter/material.dart';

import '../constants/constants.dart';
import '../main.dart';

class LightTheme extends StatelessWidget {
  const LightTheme({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = ThemeData();

    return MaterialApp(
      home: const MyHomePage(),
      theme: theme.copyWith(
        colorScheme: theme.colorScheme.copyWith(
          primary: cWhite,
          secondary: cGreen,
        ),
        textTheme: theme.textTheme.copyWith(
          titleLarge: const TextStyle(
            fontFamily: "OpenSans",
            fontSize: 20,
            color: cWhite,
            fontWeight: FontWeight.bold,
          ),
          bodyMedium: const TextStyle(
            fontFamily: "OpenSans",
            fontSize: 16,
            color: cBlack,
          ),
          bodyLarge: const TextStyle(
            fontFamily: "OpenSans",
            fontSize: 25,
            color: cBlack,
            fontWeight: FontWeight.bold,
          ),
          displaySmall: const TextStyle(
            fontFamily: "OpenSans",
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: cBlack,
          ),
          displayMedium: const TextStyle(
            fontFamily: "OpenSans",
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: cBlack,
          ),
          displayLarge: const TextStyle(
            fontFamily: "OpenSans",
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: cBlack,
          ),
          headlineSmall: const TextStyle(
            fontFamily: "OpenSans",
            fontSize: 16,
            color: cWhite,
          ),
          headlineMedium: const TextStyle(
            fontFamily: "OpenSans",
            fontSize: 18,
            color: cBlack,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
