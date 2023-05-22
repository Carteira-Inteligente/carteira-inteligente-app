import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../constants/colors.dart';
import '../AppBar/app_bar_add_button.dart';
import '../AppBar/app_bar_leading.dart';

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
