import 'package:carteira_inteligente/constants/colors.dart';
import 'package:carteira_inteligente/constants/svgs.dart';
import 'package:carteira_inteligente/constants/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RoundedIconContainer extends StatelessWidget {
  const RoundedIconContainer(this.svgPicture, this.backgroundColor, this.radius,
      {super.key});

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
