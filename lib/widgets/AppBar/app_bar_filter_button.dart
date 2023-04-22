import 'package:carteira_inteligente/constants/constants.dart';
import 'package:carteira_inteligente/screens/Initial/initial_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppBarFilterButton extends StatefulWidget {
  const AppBarFilterButton({super.key});

  @override
  State<AppBarFilterButton> createState() => _AppBarFilterButtonState();
}

class _AppBarFilterButtonState extends State<AppBarFilterButton> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
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
