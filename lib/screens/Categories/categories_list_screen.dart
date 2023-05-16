import 'package:carteira_inteligente/constants/categories.dart';
import 'package:carteira_inteligente/constants/constants.dart';
import 'package:carteira_inteligente/models/categories.dart';
import 'package:carteira_inteligente/widgets/Buttons/primary_button.dart';
import 'package:carteira_inteligente/widgets/Cards/category_card.dart';
import 'package:carteira_inteligente/widgets/Containers/divider_container.dart';
import 'package:carteira_inteligente/widgets/Labels/modal_label.dart';
import 'package:flutter/material.dart';

class CategoriesListScreen extends StatefulWidget {
  const CategoriesListScreen({super.key});

  @override
  State<CategoriesListScreen> createState() => _CategoriesListScreenState();
}

class _CategoriesListScreenState extends State<CategoriesListScreen> {
  final List<Categories> _categories = categoryList;

  void _sortCategories() {
    _categories.sort((a, b) => a.description.compareTo(b.description));
  }

  _buildCategoryCard(BuildContext context, Categories category) {
    return CategoryCard(
      category.icon,
      category.description,
    );
  }

  // final List<Categories> _addCategories = [];
  // _addCategory(
  //   int idUser,
  //   String description,
  //   SvgPicture icon,
  // ) {
  //   final newCategory = Categories(
  //     id: Random().nextInt(999).toInt(),
  //     description: description,
  //     icon: SvgPicture.asset(sOther),
  //   );

  //   setState(() {
  //     _addCategories.add(newCategory);
  //   });

  //   Future.delayed(const Duration(milliseconds: 500), () {
  //     Navigator.of(context).pop();
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    _sortCategories();
    return Column(
      children: <Widget>[
        const ModalLabel("Selecionar categoria"),
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
          wLargeButtonMinimunSize,
          "Nova categoria",
          () {},
          // () => Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //     builder: (context) => CategoriesFormScreen(_addCategory),
          //   ),
          // ),
        ),
      ],
    );
  }
}
