import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../constants/colors.dart';
import '../AppBar/app_bar_add_button.dart';
import '../AppBar/app_bar_leading.dart';
import '../AppBar/app_bar_title.dart';

class ScreenFormContainer extends StatelessWidget {
  const ScreenFormContainer(
      this.title, this.tooltip, this.onPressed, this.bodyWidget,
      {super.key});

  final String title;
  final String tooltip;
  final Widget bodyWidget;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const AppBarLeading(),
        elevation: 2,
        backgroundColor: Theme.of(context).primaryColor,
        systemOverlayStyle: SystemUiOverlayStyle.light,
        title: AppBarTitle(title),
        actions: <Widget>[
          AppBarAddButton(
            tooltip,
            onPressed,
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
                    horizontal: 20.0,
                    vertical: 10.0,
                  ),
                  child: bodyWidget,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
