import 'package:carteira_inteligente_app/widgets/Containers/title_screen_container.dart';
import 'package:flutter/material.dart';

class EntryScreen extends StatefulWidget {
  const EntryScreen({super.key});

  @override
  State<EntryScreen> createState() => _LancamentosScreenState();
}

class _LancamentosScreenState extends State<EntryScreen> {
  @override
  Widget build(BuildContext context) {
    return const TitleScreenContainer("Lançamentos");
  }
}
