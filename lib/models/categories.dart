import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Categories {
  final int id;
  final String description;
  final SvgPicture icon;

  Categories({
    required this.id,
    required this.description,
    required this.icon,
  });
}
