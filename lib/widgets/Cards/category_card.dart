import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key,
    required this.onTap,
    required this.icon,
    required this.description,
  });

  final void Function() onTap;
  final Widget icon;
  final String description;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: icon,
      title: Text(
        description,
        style: Theme.of(context).textTheme.displaySmall,
      ),
    );
  }
}
