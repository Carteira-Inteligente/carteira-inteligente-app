import 'package:flutter/material.dart';

import '../../constants/colors.dart';

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
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          icon,
          Padding(
            padding: const EdgeInsets.only(top: 5.0),
            child: Text(
              description,
              style: TextStyle(
                fontFamily: "OpenSans",
                fontSize: 12,
                color: cGrey.shade600,
                fontWeight: FontWeight.normal,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
