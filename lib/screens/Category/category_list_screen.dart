import 'package:flutter/material.dart';

import '../../data/categories_data.dart';
import '../../models/category.dart';
import '../../widgets/Buttons/primary_button.dart';
import '../../widgets/Cards/category_card.dart';
import '../../widgets/Containers/divider_container.dart';
import '../../widgets/Labels/modal_title_label.dart';

class CategoryListScreen extends StatefulWidget {
  const CategoryListScreen(this.onCategorySelected, {super.key});

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
      () {
        widget.onCategorySelected(category.description);
        Navigator.pop(context);
      },
      category.icon,
      category.description,
    );
  }

  @override
  Widget build(BuildContext context) {
    _sortCategories();
    return Column(
      children: <Widget>[
        const ModalTitleLabel("Selecionar categoria"),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.66,
          child: ListView.builder(
            itemCount: _categories.length,
            itemBuilder: (context, index) {
              final category = _categories[index];

              if (index == _categories.length - 1) {
                return _buildCategoryCard(context, category);
              } else {
                return Column(
                  children: <Widget>[
                    _buildCategoryCard(context, category),
                    const DividerContainer(),
                  ],
                );
              }
            },
          ),
        ),
        PrimaryButton(
          "Nova categoria",
          () {},
        ),
      ],
    );
  }
}
