import 'dart:math';

import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../constants/svgs.dart';
import '../../data/categories_data.dart';
import '../../models/category.dart';
import '../../widgets/Buttons/primary_button.dart';
import '../../widgets/Cards/category_card.dart';
import '../../widgets/Containers/rounded_icon_container.dart';
import '../../widgets/Labels/modal_title_label.dart';
import 'category_form_screen.dart';

class CategoryListScreen extends StatefulWidget {
  const CategoryListScreen({
    super.key,
    required this.onCategorySelected,
  });

  final void Function(String) onCategorySelected;

  @override
  State<CategoryListScreen> createState() => _CategoryListScreenState();
}

class _CategoryListScreenState extends State<CategoryListScreen> {
  final List<Category> _categories = categoryList;

  void _sortCategories() {
    _categories.sort((a, b) => a.description.compareTo(b.description));
  }

  Widget _buildCategoryCard(BuildContext context, Category category) {
    return CategoryCard(
      onTap: () {
        widget.onCategorySelected(category.description);
        Navigator.pop(context);
      },
      icon: category.icon,
      description: category.description,
    );
  }

  _addCategory(String description) {
    final newCategory = Category(
      id: Random().nextInt(999).toInt(),
      description: description,
      icon: RoundedIconContainer(
        svgPicture: sCategory,
        backgroundColor: cPurple.shade200,
        radius: 30,
      ),
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
    return Column(
      children: <Widget>[
        const ModalTitleLabel(label: "Selecione a categoria"),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.66,
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 20,
            ),
            itemCount: _categories.length,
            itemBuilder: (context, index) {
              final category = _categories[index];
              return _buildCategoryCard(context, category);
            },
          ),
        ),
        PrimaryButton(
          textButton: "Nova categoria",
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    CategoryFormScreen(onSubmit: _addCategory),
              ),
            );
          },
        ),
      ],
    );
  }
}
