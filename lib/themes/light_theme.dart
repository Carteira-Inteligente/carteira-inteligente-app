import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import '../constants/colors.dart';
import '../main.dart';

class LightTheme extends StatelessWidget {
  const LightTheme({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = ThemeData();

    return MaterialApp(
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [Locale("pt")],
      home: const MyHomePage(),
      debugShowCheckedModeBanner: false,
      theme: theme.copyWith(
        colorScheme: theme.colorScheme.copyWith(
          primary: cBlue.shade800,
          secondary: cBlue.shade300,
        ),
        textTheme: theme.textTheme.copyWith(
          titleLarge: TextStyle(
            // Tema utilizado para títulos
            fontFamily: "OpenSans",
            fontSize: 18,
            color: cBlue.shade800,
            fontWeight: FontWeight.normal,
          ),
          titleMedium: TextStyle(
            // Tema utilizado para subtítulos
            fontFamily: "OpenSans",
            fontSize: 18,
            color: cGrey.shade600,
            fontWeight: FontWeight.bold,
          ),
          titleSmall: TextStyle(
            // Tema utilizado para subtítulos menores
            fontFamily: "OpenSans",
            fontSize: 18,
            color: cGrey.shade600,
            fontWeight: FontWeight.normal,
          ),
          bodyLarge: const TextStyle(
            // Tema utilizado para títulos brancos
            fontFamily: "OpenSans",
            fontSize: 25,
            color: cWhite,
            fontWeight: FontWeight.bold,
          ),
          bodyMedium: const TextStyle(
            // Tema utilizado para subtítulos brancos
            fontFamily: "OpenSans",
            fontSize: 18,
            color: cWhite,
            fontWeight: FontWeight.bold,
          ),
          displaySmall: TextStyle(
            // Tema utilizado para labels e informações gerais
            fontFamily: "OpenSans",
            fontSize: 16,
            color: cGrey.shade600,
          ),
          headlineLarge: TextStyle(
            // Tema utilizado para título do ListTile
            fontFamily: "OpenSans",
            fontSize: 16,
            color: cGrey.shade600,
            fontWeight: FontWeight.bold,
          ),
          headlineSmall: const TextStyle(
            // Tema utilizado para dados da tela de detalhes em negrito
            fontFamily: "OpenSans",
            fontSize: 16,
            color: cBlack,
            fontWeight: FontWeight.bold,
          ),
          labelLarge: const TextStyle(
            // Tema utilizado para botões primários
            fontFamily: "OpenSans",
            fontSize: 16,
            color: cWhite,
          ),
          labelMedium: TextStyle(
            // Tema utilizado para botões secundários
            fontFamily: "OpenSans",
            fontSize: 16,
            color: cBlue.shade800,
          ),
          labelSmall: const TextStyle(
            // Tema utilizado para dados da tela de detalhes
            fontFamily: "OpenSans",
            fontSize: 16,
            color: cBlack,
          ),
        ),
      ),
    );
  }
}
