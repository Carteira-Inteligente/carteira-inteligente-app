import 'dart:math';

import 'package:carteira_inteligente/screens/Category/category_form_screen.dart';
import 'package:carteira_inteligente/screens/Category/edit_category_form_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../constants/colors.dart';
import '../../constants/svgs.dart';
import '../../data/categories_data.dart';
import '../../models/category.dart';
import '../../widgets/Cards/list_cards.dart';
import '../../widgets/Containers/form_containers.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  final List<Category> _categories = categoryList;

  void _sortCategories() {
    _categories.sort((a, b) => a.description.compareTo(b.description));
  }

  _buildCategoryCard(BuildContext context, Category category) {
    return CategoryListCard(
      description: category.description,
      actionButton: IconButton(
        icon: SvgPicture.asset(
          sEdit,
          color: cGrey.shade600,
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  EditCategoryFormScreen(onSubmit: _addCategory),
            ),
          );
        },
      ),
    );
  }

  _addCategory(String description) {
    final newCategory = Category(
      id: Random().nextInt(999).toInt(),
      description: description,
      icon: sCategory,
      iconColor: const Color(0xFF1F70A2),
      backgroundColor: const Color(0xFFBED3E7),
      // const RoundedIconContainer(
      //   svgPicture: sCategory,
      //   svgColor: Color(0xFF1F70A2),
      //   backgroundColor: Color(0xFFBED3E7),
      //   radius: 30,
      // ),
    );

    setState(() {
      categoryList.add(newCategory);
    });

    Future.delayed(const Duration(milliseconds: 500), () {
      Navigator.of(context).pop();
    });
  }

  @override
  Widget build(BuildContext context) {
    _sortCategories();
    return ScreenFormContainer(
      title: "Categorias personalizadas",
      tooltip: "Nova categoria",
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CategoryFormScreen(onSubmit: _addCategory),
          ),
        );
      },
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: ListView.builder(
          itemCount: _categories.length,
          itemBuilder: (context, index) {
            final category = _categories[index];
            if (category.description == "Personalizada") {
              return _buildCategoryCard(context, category);
            }
            return Container();
          },
        ),
      ),
    );
  }
}
