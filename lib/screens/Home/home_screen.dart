import 'package:carteira_inteligente_app/widgets/Cards/custom_cards.dart';
import 'package:carteira_inteligente_app/widgets/Containers/title_screen_container.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: const [
            TitleScreenContainer("Bem-vindo!"),
          ],
        ),
        const CustomCards("Teste", "Botão"),
        const CustomCards("Teste 2", "Botão 2"),
      ],
    );
  }
}
