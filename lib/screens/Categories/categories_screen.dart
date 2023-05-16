import 'package:carteira_inteligente/widgets/Containers/screen_form_container.dart';
import 'package:flutter/material.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    return ScreenFormContainer(
      "Categorias personalizadas",
      "Nova categoria",
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
