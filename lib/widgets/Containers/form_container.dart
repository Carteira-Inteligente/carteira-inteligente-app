import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../constants/colors.dart';
import '../AppBar/app_bar_leading.dart';
import 'positioned_container.dart';

class FormContainer extends StatelessWidget {
  const FormContainer({
    super.key,
    required this.title,
    this.height,
    required this.bottonButton,
    required this.child,
  });

  final String title;
  final Widget bottonButton;
  final Widget child;
  final double? height;

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      leading: const AppBarLeading(),
      elevation: 0,
      backgroundColor: cWhite,
      systemOverlayStyle: SystemUiOverlayStyle.light,
      title: Row(
        children: <Widget>[
          Text(
            title,
            style: TextStyle(
              fontFamily: "OpenSans",
              fontSize: 16,
              color: cGrey.shade600,
              fontWeight: FontWeight.normal,
            ),
          ),
        ],
      ),
    );
    final positionedContainer = PositionedContainer(bottonButton: bottonButton);

    return Scaffold(
      backgroundColor: cWhite,
      appBar: appBar,
      body: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    decoration: const BoxDecoration(color: cWhite),
                    height: height,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20.0,
                      vertical: 10.0,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        child,
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          positionedContainer,
        ],
      ),
    );
  }
}
