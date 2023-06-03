import 'package:flutter/material.dart';

class Category {
  final int id;
  final String description;
  final String icon;
  final Color iconColor;
  final Color backgroundColor;

  Category({
    required this.id,
    required this.description,
    required this.icon,
    required this.iconColor,
    required this.backgroundColor,
  });
}
