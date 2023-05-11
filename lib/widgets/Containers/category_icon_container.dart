import 'package:carteira_inteligente/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CategoryIconContainer extends StatelessWidget {
  const CategoryIconContainer(this.svgPicture, this.color, this.radius,
      {super.key});

  final String svgPicture;
  final Color color;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: wBorderRadius50,
      ),
      child: CircleAvatar(
        backgroundColor: color,
        radius: radius,
        child: Container(
          padding: const EdgeInsets.all(6.0),
          child: SvgPicture.asset(
            svgPicture,
            color: cWhite,
          ),
        ),
      ),
    );
  }
}
