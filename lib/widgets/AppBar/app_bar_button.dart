import 'package:carteira_inteligente/constants/constants.dart';
import 'package:carteira_inteligente/screens/Initial/initial_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppBarButton extends StatefulWidget {
  const AppBarButton({super.key});

  @override
  State<AppBarButton> createState() => _AppBarButtonState();
}

class _AppBarButtonState extends State<AppBarButton> {
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
        sNotification,
        color: cWhite,
      ),
    );
  }
}
