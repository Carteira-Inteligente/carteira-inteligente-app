import "package:flutter/material.dart";

import "../constants/svgs.dart";

class Category {
  final int id;
  final String description;
  final String pathIcon;
  final Color iconColor;
  final Color backgroundColor;
  final bool isDefault;

  Category({
    required this.id,
    required this.description,
    required this.pathIcon,
    required this.iconColor,
    required this.backgroundColor,
    required this.isDefault,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json["id"] ?? 0,
      description: json["description"] ?? "",
      pathIcon: json["pathIcon"] ?? sCategory,
      iconColor: json["iconColor"] != null
          ? Color(json["iconColor"])
          : const Color(0xFF146AA0),
      backgroundColor: json["backgroundColor"] != null
          ? Color(json["backgroundColor"])
          : const Color(0xFFD9E8F6),
      isDefault: json["isDefault"] ?? false,
    );
  }
}
