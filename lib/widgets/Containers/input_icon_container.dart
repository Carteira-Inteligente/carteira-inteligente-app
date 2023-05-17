import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../constants/colors.dart';

class InputIconContainer extends StatelessWidget {
  const InputIconContainer(this.svgIcon, {super.key});

  final String svgIcon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Transform.scale(
        scale: 0.5,
        child: SvgPicture.asset(
          svgIcon,
          color: cGrey.shade600,
        ),
      ),
    );
  }
}
