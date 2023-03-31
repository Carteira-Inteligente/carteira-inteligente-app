import 'package:carteira_inteligente_app/constants/constants.dart';
import 'package:carteira_inteligente_app/screens/Initial/initial_screen.dart';
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
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const InitialScreen(),
          ),
        );
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: cTransparent,
        elevation: 0,
      ),
      child: SvgPicture.asset(sNotification),
    );
  }
}
