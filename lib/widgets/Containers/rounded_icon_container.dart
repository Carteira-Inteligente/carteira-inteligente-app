import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../constants/colors.dart';
import '../../constants/widgets.dart';

class RoundedIconContainer extends StatelessWidget {
  const RoundedIconContainer({
    super.key,
    required this.pathIcon,
    this.iconColor,
    required this.backgroundColor,
    required this.radius,
    this.heigth,
  });

  final String pathIcon;
  final Color? iconColor;
  final Color backgroundColor;
  final double radius;
  final double? heigth;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: CircleAvatar(
        backgroundColor: backgroundColor,
        radius: radius,
        child: Container(
          padding: const EdgeInsets.all(6.0),
          child: SvgPicture.asset(
            pathIcon,
            color: backgroundColor == cGrey.shade200 ? cBlack : iconColor,
            height: heigth,
          ),
        ),
      ),
    );
  }
}
