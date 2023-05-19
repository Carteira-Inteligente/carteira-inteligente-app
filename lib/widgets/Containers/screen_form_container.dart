import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../constants/colors.dart';
import '../AppBar/app_bar_add_button.dart';
import '../AppBar/app_bar_leading.dart';
import '../AppBar/app_bar_title.dart';

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
        elevation: 2,
        backgroundColor: cBlue.shade700,
        systemOverlayStyle: SystemUiOverlayStyle.light,
        title: AppBarTitle(title: title),
        actions: <Widget>[
          AppBarAddButton(
            tooltip: tooltip,
            onPressed: onPressed,
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
