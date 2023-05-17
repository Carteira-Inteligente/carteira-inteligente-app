import 'package:flutter/material.dart';

import '../../constants/images.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(iSplash),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
