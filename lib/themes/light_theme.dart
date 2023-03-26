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
          primary: cBlue,
          secondary: cGreen,
        ),
        textTheme: theme.textTheme.copyWith(
          displayLarge: const TextStyle(
            fontFamily: "OpenSans",
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: cBlue,
          ),
          displayMedium: const TextStyle(
            fontFamily: "OpenSans",
            fontSize: 17,
            fontWeight: FontWeight.bold,
            color: cBlack,
          ),
          displaySmall: const TextStyle(
            fontFamily: "OpenSans",
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: cBlack,
          ),
          headlineMedium: const TextStyle(
            fontFamily: "OpenSans",
            fontSize: 14,
            color: cGrey,
          ),
          headlineSmall: const TextStyle(
            fontFamily: "OpenSans",
            fontSize: 17,
            color: cWhite,
          ),
          titleLarge: const TextStyle(
            fontFamily: "OpenSans",
            fontSize: 20,
            color: cWhite,
          ),
          bodyLarge: const TextStyle(
            fontFamily: "OpenSans",
            fontSize: 25,
            color: cBlue,
          ),
          bodyMedium: const TextStyle(
            fontFamily: "OpenSans",
            fontSize: 16,
            color: cBlack,
          ),
        ),
      ),
    );
  }
}
