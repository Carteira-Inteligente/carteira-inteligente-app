import 'package:carteira_inteligente/constants/svgs.dart';
import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../Containers/card_container.dart';
import '../Containers/rounded_icon_container.dart';

class ListCategoryCard extends StatelessWidget {
  const ListCategoryCard({
    super.key,
    required this.description,
    required this.actionButton,
  });

  final String description;
  final Widget actionButton;

  @override
  Widget build(BuildContext context) {
    return CardContainer(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: ListTile(
          leading: RoundedIconContainer(
            svgPicture: sCategory,
            backgroundColor: cPurple.shade200,
            radius: 24,
          ),
          title: Text(
            description,
            style: Theme.of(context).textTheme.displaySmall,
          ),
          trailing: actionButton,
        ),
      ),
    );
  }
}
