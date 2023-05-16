import 'package:carteira_inteligente/widgets/Containers/screen_form_container.dart';
import 'package:flutter/material.dart';

class CreditCardScreen extends StatefulWidget {
  const CreditCardScreen({super.key});

  @override
  State<CreditCardScreen> createState() => _CreditCardScreenState();
}

class _CreditCardScreenState extends State<CreditCardScreen> {
  @override
  Widget build(BuildContext context) {
    return ScreenFormContainer(
      "Cartões de crédito",
      "Novo cartão de crédito",
      () {
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) => CategoriesFormScreen(),
        //   ),
        // );
      },
      const Placeholder(),
    );
  }
}
