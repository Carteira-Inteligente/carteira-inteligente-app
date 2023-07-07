import 'package:flutter/material.dart';

import '../../constants/svgs.dart';
import '../../models/category.dart';
import '../../services/category_service.dart';
import '../../widgets/Cards/list_cards.dart';
import '../../widgets/Containers/form_containers.dart';
import '../../widgets/Containers/progress_containers.dart';
import 'category_form_screen.dart';
import 'edit_category_form_screen.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  List<Category> _categories = [];
  bool _isLoading = false;

  Future<List<Category>> _fetchCategories() async {
    setState(() {
      _isLoading = true;
    });

    final categories = await CategoryService.findAll();

    setState(() {
      _isLoading = false;
      _categories = categories;
    });

    return categories;
  }

  _createCategory(String description) async {
    final createdCategory = await CategoryService.post(context, description);

    setState(() {
      _categories.add(createdCategory);
    });
  }

  _updateCategory(Category category, String description) async {
    final updatedCategory = await CategoryService.put(
      context,
      category,
      description,
    );

    final index = _categories.indexWhere(
      (category) => category.id == updatedCategory.id,
    );

    if (index != -1) {
      setState(() {
        _categories[index] = updatedCategory;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchCategories();
  }

  _buildCategoryCard(BuildContext context, Category category) {
    return CategoryListCard(
      description: category.description,
      svgColor: category.iconColor,
      backgroundColor: category.backgroundColor,
      onEdit: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => EditCategoryFormScreen(
            category: category,
            onSubmit: (description) => _updateCategory(category, description),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ScreenFormContainer(
      title: "Categorias personalizadas",
      tooltip: "Nova categoria",
      onPressed: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CategoryFormScreen(onSubmit: _createCategory),
        ),
      ),
      child: _isLoading
          ? ProgressIndicatorContainer(visible: _isLoading)
          : RefreshIndicator(
              onRefresh: _fetchCategories,
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: _categories.length,
                  itemBuilder: (context, index) {
                    final category = _categories[index];
                    if (category.pathIcon == sCategory) {
                      return _buildCategoryCard(context, category);
                    }
                    return Container();
                  },
                ),
              ),
            ),
    );
  }
}
