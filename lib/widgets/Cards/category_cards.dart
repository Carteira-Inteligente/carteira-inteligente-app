import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../Containers/rounded_icon_container.dart';
import '../Labels/input_label.dart';

class GridViewCategoryCard extends StatelessWidget {
  const GridViewCategoryCard({
    super.key,
    required this.onTap,
    required this.icon,
    required this.iconColor,
    required this.backgroundColor,
    required this.description,
  });

  final void Function() onTap;
  final String icon;
  final Color iconColor;
  final Color backgroundColor;
  final String description;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          RoundedIconContainer(
            pathIcon: icon,
            iconColor: iconColor,
            backgroundColor: backgroundColor,
            radius: 30,
          ),
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

class ListViewCategoryCard extends StatelessWidget {
  const ListViewCategoryCard({
    super.key,
    required this.onTap,
    required this.icon,
    required this.iconColor,
    required this.backgroundColor,
    required this.description,
  });

  final void Function() onTap;
  final String icon;
  final Color iconColor;
  final Color backgroundColor;
  final String description;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: RoundedIconContainer(
        pathIcon: icon,
        iconColor: iconColor,
        backgroundColor: backgroundColor,
        radius: 24,
      ),
      title: InputLabel(label: description),
    );
  }
}
