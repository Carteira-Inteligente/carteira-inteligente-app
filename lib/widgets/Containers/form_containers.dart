import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../constants/colors.dart';
import '../AppBar/app_bar_buttons.dart';
import '../AppBar/app_bar_leading.dart';
import 'button_containers.dart';

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
      leading: const AppBarLeadingReturn(),
      elevation: 0,
      backgroundColor: cWhite,
      systemOverlayStyle: SystemUiOverlayStyle.dark,
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
    final positionedContainer = BottomButtonContainer(
      bottonButton: bottonButton,
    );

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

class ScreenFormContainer extends StatelessWidget {
  const ScreenFormContainer({
    super.key,
    required this.title,
    required this.tooltip,
    required this.child,
    required this.onPressed,
  });

  final String title;
  final String tooltip;
  final Widget child;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const AppBarLeadingReturn(),
        elevation: 0,
        backgroundColor: cWhite,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
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
        actions: <Widget>[
          AppBarAddButton(
            tooltip: tooltip,
            onPressed: onPressed,
            blueIcon: true,
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                decoration: const BoxDecoration(color: cWhite),
                height: MediaQuery.of(context).size.height,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10.0,
                  ),
                  child: child,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
