import 'package:carteira_inteligente/constants/constants.dart';
import 'package:carteira_inteligente/main.dart';
import 'package:flutter/material.dart';

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
          secondary: cWhite,
        ),
        textTheme: theme.textTheme.copyWith(
          titleLarge: TextStyle(
            // Tema utilizado para títulos
            fontFamily: "OpenSans",
            fontSize: 25,
            color: theme.primaryColor,
            fontWeight: FontWeight.bold,
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
            color: theme.primaryColor,
          ),
          labelSmall: const TextStyle(
            // Tema utilizado para dados da tela de detalhes
            fontFamily: "OpenSans",
            fontSize: 16,
            color: cBlack,
          ),
          headlineSmall: const TextStyle(
            // Tema utilizado para dados da tela de detalhes em negrito
            fontFamily: "OpenSans",
            fontSize: 16,
            color: cBlack,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
