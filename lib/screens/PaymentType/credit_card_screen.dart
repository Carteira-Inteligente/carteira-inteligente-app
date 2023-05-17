import 'package:flutter/material.dart';

import '../../widgets/Containers/screen_form_container.dart';

class CreditCardScreen extends StatefulWidget {
  const CreditCardScreen({super.key});

  @override
  State<CreditCardScreen> createState() => _CreditCardScreenState();
}

class _CreditCardScreenState extends State<CreditCardScreen> {
  @override
  Widget build(BuildContext context) {
    return ScreenFormContainer(
      title: "Cartões de crédito",
      tooltip: "Novo cartão de crédito",
      onPressed: () {
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) => CategoriesFormScreen(),
        //   ),
        // );
      },
      child: const Placeholder(),
    );
  }
}
