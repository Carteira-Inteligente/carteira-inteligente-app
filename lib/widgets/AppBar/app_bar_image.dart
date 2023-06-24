import 'package:flutter/material.dart';

import '../../constants/images.dart';

class AppBarImage extends StatelessWidget {
  const AppBarImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        SizedBox(
          child: Image.asset(
            iLinearWhiteLogo,
            width: 180,
          ),
        ),
      ],
    );
  }
}
