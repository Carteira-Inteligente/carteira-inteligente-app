import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../constants/colors.dart';
import '../../constants/svgs.dart';
import '../../models/category.dart';
import '../../routes/app_routes.dart';
import '../../utils/sort_categories.dart';
import '../../utils/toast_message.dart';
import '../../widgets/Buttons/primary_buttons.dart';
import '../../widgets/Cards/category_card.dart';
import '../../widgets/Containers/divider_container.dart';
import '../../widgets/Containers/progress_containers.dart';
import '../../widgets/Labels/modal_title_label.dart';
import '../Category/category_form_screen.dart';

class CategoryModal extends StatefulWidget {
  const CategoryModal({
    super.key,
    required this.onSelected,
  });

  final void Function(String, int) onSelected;

  @override
  State<CategoryModal> createState() => _CategoryModalState();
}

class _CategoryModalState extends State<CategoryModal> {
  List<Category> _categories = [];
  bool _isLoading = false;
  bool _isGridView = false;

  Future<List<Category>> _fetchCategories() async {
    setState(() {
      _isLoading = true;
    });

    final response = await http.get(
      Uri.parse(AppRoutes.categoryRoute),
    );

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final categories = List<Category>.from(
        jsonData.map((data) => Category.fromJson(data)),
      );

      setState(() {
        _isLoading = false;
        _categories = categories;
      });

      return categories;
    } else {
      throw Exception("Falha ao listar as categorias.");
    }
  }

  _createCategory(String description) async {
    final response = await http.post(
      Uri.parse(AppRoutes.categoryRoute),
      body: json.encode({
        "user": {"id": 1},
        "description": description,
        "pathIcon": sCategory,
        "iconColor": 0xFF1F70A2,
        "backgroundColor": 0xFFBED3E7,
      }),
      headers: {"Content-Type": "application/json"},
    );

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final createdCategory = Category.fromJson(jsonData);

      setState(() {
        _categories.add(createdCategory);
      });

      ToastMessage.successToast("Categoria criada com sucesso.");
      Navigator.pop(context);
    } else {
      ToastMessage.dangerToast("Falha ao criar a categoria.");
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchCategories();
  }

  Widget _buildGridViewCard(BuildContext context, Category category) {
    return GridViewCategoryCard(
      onTap: () {
        widget.onSelected(category.description, category.id);
        Navigator.pop(context);
      },
      icon: category.pathIcon,
      iconColor: category.iconColor,
      backgroundColor: category.backgroundColor,
      description: category.description,
    );
  }

  Widget _buildListViewCard(BuildContext context, Category category) {
    return Column(
      children: [
        ListViewCategoryCard(
          onTap: () {
            widget.onSelected(category.description, category.id);
            Navigator.pop(context);
          },
          icon: category.pathIcon,
          iconColor: category.iconColor,
          backgroundColor: category.backgroundColor,
          description: category.description,
        ),
        const DividerContainer(),
      ],
    );
  }

  void toggleView() {
    setState(() {
      _isGridView = !_isGridView;
    });
  }

  @override
  Widget build(BuildContext context) {
    sortDecriptions(_categories);
    Widget gridView = GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 20,
      ),
      itemCount: _categories.length,
      itemBuilder: (context, index) {
        final category = _categories[index];
        return _buildGridViewCard(context, category);
      },
    );

    Widget listView = ListView.builder(
      itemCount: _categories.length,
      itemBuilder: (context, index) {
        final category = _categories[index];
        return _buildListViewCard(context, category);
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
          child: _isLoading
              ? ProgressIndicatorContainer(visible: _isLoading)
              : _isGridView
                  ? gridView
                  : listView,
        ),
        PrimaryButton(
          textButton: "Nova categoria",
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    CategoryFormScreen(onSubmit: _createCategory),
              ),
            );
          },
        ),
      ],
    );
  }
}
