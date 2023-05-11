import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard(this.icon, this.description, {super.key});

  final Widget icon;
  final String description;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {},
      leading: icon,
      title: Text(
        description,
        style: Theme.of(context).textTheme.displaySmall,
      ),
    );
  }
}
