import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../constants/colors.dart';
import '../../constants/widgets.dart';

class RoundedIconContainer extends StatelessWidget {
  const RoundedIconContainer({
    super.key,
    required this.svgPicture,
    this.svgColor,
    required this.backgroundColor,
    required this.radius,
    this.heigth,
  });

  final String svgPicture;
  final Color? svgColor;
  final Color backgroundColor;
  final double radius;
  final double? heigth;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(borderRadius: wBorderRadius50),
      child: CircleAvatar(
        backgroundColor: backgroundColor,
        radius: radius,
        child: Container(
          padding: const EdgeInsets.all(6.0),
          child: SvgPicture.asset(
            svgPicture,
            color: backgroundColor == cGrey.shade200 ? cBlack : svgColor,
            height: heigth,
          ),
        ),
      ),
    );
  }
}
