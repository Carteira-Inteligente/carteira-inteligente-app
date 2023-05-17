import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../constants/colors.dart';
import '../../constants/svgs.dart';
import '../../constants/widgets.dart';

class RoundedIconContainer extends StatelessWidget {
  const RoundedIconContainer({
    super.key,
    required this.svgPicture,
    required this.backgroundColor,
    required this.radius,
  });

  final String svgPicture;
  final Color backgroundColor;
  final double radius;

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
            color: backgroundColor == cGrey.shade200 ? cBlack : cWhite,
            height: svgPicture == sUser ? 45 : null,
          ),
        ),
      ),
    );
  }
}
