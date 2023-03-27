import 'package:carteira_inteligente_app/widgets/Containers/title_screen_container.dart';
import 'package:flutter/material.dart';

class LancamentosScreen extends StatefulWidget {
  const LancamentosScreen({super.key});

  @override
  State<LancamentosScreen> createState() => _LancamentosScreenState();
}

class _LancamentosScreenState extends State<LancamentosScreen> {
  @override
  Widget build(BuildContext context) {
    return const TitleScreenContainer("Lançamentos");
  }
}
