import 'package:flutter/material.dart';

import '../../widgets/Containers/screen_form_container.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
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
