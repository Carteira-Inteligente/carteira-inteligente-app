import 'package:carteira_inteligente/constants/colors.dart';
import 'package:flutter/material.dart';

import '../../constants/svgs.dart';
import '../Containers/rounded_icon_container.dart';

class AppBarLeading extends StatelessWidget {
  const AppBarLeading({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => Navigator.pop(context),
      icon: RoundedIconContainer(
        backgroundColor: cBlue.shade800,
        radius: 24,
        svgPicture: sArrowLeft,
      ),
    );
  }
}
