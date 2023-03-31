import 'package:carteira_inteligente_app/themes/dark_status_bar_theme.dart';
import 'package:carteira_inteligente_app/widgets/Labels/title_label.dart';
import 'package:flutter/material.dart';

class EntryScreen extends StatefulWidget {
  const EntryScreen({super.key});

  @override
  State<EntryScreen> createState() => _LancamentosScreenState();
}

class _LancamentosScreenState extends State<EntryScreen> {
  @override
  Widget build(BuildContext context) {
    return const DarkStatusBarTheme(
      TitleLabel("Lançamentos"),
    );
  }
}
