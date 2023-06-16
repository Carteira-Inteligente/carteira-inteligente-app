import 'package:flutter/material.dart';

class Category {
  final int id;
  final String description;
  final String pathIcon;
  final Color iconColor;
  final Color backgroundColor;

  Category({
    required this.id,
    required this.description,
    required this.pathIcon,
    required this.iconColor,
    required this.backgroundColor,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'] ?? 0,
      description: json['description'],
      pathIcon: json['pathIcon'],
      iconColor: json['iconColor'] != null
          ? Color(json['iconColor'])
          : const Color(0xFF1F70A2),
      backgroundColor: json['backgroundColor'] != null
          ? Color(json['backgroundColor'])
          : const Color(0xFFBED3E7),
    );
  }
}
