import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../constants/colors.dart';

class ButtonNavigation extends StatelessWidget {
  const ButtonNavigation({
    super.key,
    required this.onPressed,
    required this.svgIcon,
  });

  final void Function() onPressed;
  final String svgIcon;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Container(
        padding: const EdgeInsets.all(5.0),
        decoration: BoxDecoration(
          color: cBlue.shade800,
          borderRadius: BorderRadius.circular(50),
        ),
        child: SvgPicture.asset(
          svgIcon,
          color: cWhite,
        ),
      ),
    );
  }
}
