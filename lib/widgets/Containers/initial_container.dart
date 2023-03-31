import 'package:carteira_inteligente_app/constants/constants.dart';
import 'package:carteira_inteligente_app/themes/light_status_bar_theme.dart';
import 'package:flutter/material.dart';

class InitialContainer extends StatelessWidget {
  const InitialContainer(this.title, this.subtitle, this.widget, {super.key});

  final String title;
  final String subtitle;
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LightStatusBarTheme(
        Container(
          decoration: const BoxDecoration(
            color: cGreen,
          ),
          child: Column(
            children: [
              Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 50.0),
                    child: Text(
                      title,
                      style: const TextStyle(
                        fontFamily: "OpenSans",
                        fontSize: 25,
                        color: cWhite,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      subtitle,
                      style: const TextStyle(
                        fontFamily: "OpenSans",
                        fontSize: 18,
                        color: cWhite,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              widget,
            ],
          ),
        ),
      ),
    );
  }
}
