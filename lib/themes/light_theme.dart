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
          headline1: const TextStyle(
            fontFamily: "OpenSans",
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: cBlue,
          ),
          headline2: const TextStyle(
            fontFamily: "OpenSans",
            fontSize: 17,
            fontWeight: FontWeight.bold,
            color: cBlack,
          ),
          headline3: const TextStyle(
            fontFamily: "OpenSans",
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: cBlack,
          ),
          headline4: const TextStyle(
            fontFamily: "OpenSans",
            fontSize: 14,
            color: cGrey,
          ),
          headline5: const TextStyle(
            fontFamily: "OpenSans",
            fontSize: 17,
            color: cWhite,
          ),
          headline6: const TextStyle(
            fontFamily: "OpenSans",
            fontSize: 20,
            color: cWhite,
          ),
          bodyText1: const TextStyle(
            fontFamily: "OpenSans",
            fontSize: 25,
            color: cBlue,
          ),
          bodyText2: const TextStyle(
            fontFamily: "OpenSans",
            fontSize: 16,
            color: cBlack,
          ),
        ),
      ),
    );
  }
}
