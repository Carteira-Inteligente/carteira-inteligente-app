import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import '../../constants/svgs.dart';
import '../../models/category.dart';
import '../../routes/app_routes.dart';
import '../../services/category_service.dart';
import '../../utils/sort_categories.dart';
import '../../utils/toast_message.dart';
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

  _updateCategory(Category category, String newDescription) async {
    final updatedCategory = Category(
      id: category.id,
      description: newDescription,
      backgroundColor: const Color(0xFFBED3E7),
      iconColor: const Color(0xFF1F70A2),
      pathIcon: sCategory,
    );

    final response = await http.put(
      Uri.parse("${AppRoutes.categoryRoute}/${category.id}"),
      body: json.encode({
        "user": {"id": 1},
        "description": newDescription,
        "pathIcon": sCategory,
        "iconColor": 0xFF1F70A2,
        "backgroundColor": 0xFFBED3E7,
      }),
      headers: {"Content-Type": "application/json"},
    );

    if (response.statusCode == 200) {
      setState(() {
        _categories = _categories.map((category) {
          if (category.id == updatedCategory.id) {
            return updatedCategory;
          }
          return category;
        }).toList();
      });

      ToastMessage.successToast("Categoria atualizada com sucesso.");
      Navigator.pop(context);
    } else {
      ToastMessage.dangerToast("Falha ao atualizar a categoria.");
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
            onSubmit: (description) {
              _updateCategory(category, description);
            },
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    sortDecriptions(_categories);
    return ScreenFormContainer(
      title: "Categorias personalizadas",
      tooltip: "Nova categoria",
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CategoryFormScreen(onSubmit: _createCategory),
          ),
        );
      },
      child: _isLoading
          ? ProgressIndicatorContainer(visible: _isLoading)
          : RefreshIndicator(
              onRefresh: _fetchCategories,
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: ListView.builder(
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
