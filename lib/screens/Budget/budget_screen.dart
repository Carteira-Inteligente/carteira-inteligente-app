import 'package:carteira_inteligente_app/themes/dark_status_bar_theme.dart';
import 'package:carteira_inteligente_app/widgets/Labels/title_label.dart';
import 'package:flutter/material.dart';

class BudgetScreen extends StatefulWidget {
  const BudgetScreen({super.key});

  @override
  State<BudgetScreen> createState() => _BudgetScreenState();
}

class _BudgetScreenState extends State<BudgetScreen> {
  @override
  Widget build(BuildContext context) {
    return const DarkStatusBarTheme(
      TitleLabel("Orçamento"),
    );
  }
}
