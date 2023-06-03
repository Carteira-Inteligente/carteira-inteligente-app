import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../constants/colors.dart';
import '../../constants/svgs.dart';
import '../../data/categories_data.dart';
import '../../models/category.dart';
import '../../widgets/Buttons/primary_buttons.dart';
import '../../widgets/Cards/category_card.dart';
import '../../widgets/Containers/divider_container.dart';
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

  Widget _buildGridViewCategoryCard(BuildContext context, Category category) {
    return GridViewCategoryCard(
      onTap: () {
        widget.onCategorySelected(category.description);
        Navigator.pop(context);
      },
      icon: category.icon,
      iconColor: category.iconColor,
      backgroundColor: category.backgroundColor,
      description: category.description,
    );
  }

  Widget _buildListViewCategoryCard(BuildContext context, Category category) {
    return Column(
      children: [
        ListViewCategoryCard(
          onTap: () {
            widget.onCategorySelected(category.description);
            Navigator.pop(context);
          },
          icon: category.icon,
          iconColor: category.iconColor,
          backgroundColor: category.backgroundColor,
          description: category.description,
        ),
        const DividerContainer(),
      ],
    );
  }

  _addCategory(String description) {
    final newCategory = Category(
      id: Random().nextInt(999).toInt(),
      description: description,
      icon: sCategory,
      iconColor: const Color(0xFF1F70A2),
      backgroundColor: const Color(0xFFBED3E7),
    );

    setState(() {
      categoryList.add(newCategory);
    });

    Future.delayed(const Duration(milliseconds: 500), () {
      Navigator.of(context).pop();
    });
  }

  bool _isGridView = false;

  void toggleView() {
    setState(() {
      _isGridView = !_isGridView;
    });
  }

  @override
  Widget build(BuildContext context) {
    _sortCategories();

    Widget gridView = GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 20,
      ),
      itemCount: _categories.length,
      itemBuilder: (context, index) {
        final category = _categories[index];
        return _buildGridViewCategoryCard(context, category);
      },
    );

    Widget listView = ListView.builder(
      itemCount: _categories.length,
      itemBuilder: (context, index) {
        final category = _categories[index];
        return _buildListViewCategoryCard(context, category);
      },
    );

    return Column(
      children: <Widget>[
        Stack(
          children: <Widget>[
            const Align(
              alignment: Alignment.center,
              child: ModalTitleLabel(label: "Selecione a categoria"),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: IconButton(
                padding: const EdgeInsets.only(bottom: 24.0),
                tooltip:
                    _isGridView ? "Exibição em lista" : "Exibição em grade",
                onPressed: toggleView,
                icon: _isGridView
                    ? SvgPicture.asset(
                        sListView,
                        color: cGrey.shade600,
                      )
                    : SvgPicture.asset(
                        sGridView,
                        color: cGrey.shade600,
                      ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.66,
          child: _isGridView ? gridView : listView,
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
