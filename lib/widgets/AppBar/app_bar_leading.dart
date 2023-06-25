import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../constants/colors.dart';
import '../../constants/svgs.dart';
import '../Containers/rounded_icon_container.dart';

class AppBarLeadingReturn extends StatelessWidget {
  const AppBarLeadingReturn({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => Navigator.pop(context),
      icon: RoundedIconContainer(
        backgroundColor: cBlue.shade800,
        radius: 24,
        pathIcon: sArrowLeft,
        iconColor: cWhite,
      ),
    );
  }
}

class AppBarLeadingDrawer extends StatelessWidget {
  const AppBarLeadingDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => Scaffold.of(context).openDrawer(),
      icon: SvgPicture.asset(
        sMenu,
        color: cWhite,
      ),
    );
  }
}
