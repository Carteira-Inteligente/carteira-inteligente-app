import 'package:carteira_inteligente_app/constants/constants.dart';
import 'package:flutter/material.dart';

class AppBarTitle extends StatelessWidget {
  const AppBarTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: const <Widget>[
            Text(
              "Olá, Thiago",
              style: TextStyle(
                color: cBlack,
              ),
            ),
          ],
        ),
        Row(
          children: const <Widget>[
            Text(
              "thiago@email.com",
              style: TextStyle(
                color: cBlack,
                fontSize: 13,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
