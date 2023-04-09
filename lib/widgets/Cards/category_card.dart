import 'package:carteira_inteligente/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard(this.icon, this.description, {super.key});

  final SvgPicture icon;
  final String description;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        decoration: BoxDecoration(
          borderRadius: wBorderRadius50,
          border: Border.all(color: cGrey.shade300),
        ),
        child: CircleAvatar(
          backgroundColor: cTransparent,
          radius: 24,
          child: Container(
            padding: const EdgeInsets.all(6.0),
            child: icon,
          ),
        ),
      ),
      title: Text(
        description,
        style: Theme.of(context).textTheme.displaySmall,
      ),
    );
  }
}
