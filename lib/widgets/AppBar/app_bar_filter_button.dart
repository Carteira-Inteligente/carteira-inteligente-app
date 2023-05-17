import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../constants/colors.dart';
import '../../constants/svgs.dart';
import '../../screens/Initial/initial_screen.dart';

class AppBarFilterButton extends StatefulWidget {
  const AppBarFilterButton({super.key});

  @override
  State<AppBarFilterButton> createState() => _AppBarFilterButtonState();
}

class _AppBarFilterButtonState extends State<AppBarFilterButton> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      tooltip: "Filtrar",
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const InitialScreen(),
          ),
        );
      },
      icon: SvgPicture.asset(
        sFilter,
        color: cWhite,
      ),
    );
  }
}
