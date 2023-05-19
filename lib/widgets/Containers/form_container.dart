import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../constants/colors.dart';
import '../AppBar/app_bar_leading.dart';
import '../AppBar/app_bar_title.dart';
import 'positioned_container.dart';

class FormContainer extends StatelessWidget {
  const FormContainer({
    super.key,
    required this.title,
    required this.bottonButton,
    required this.child,
  });

  final String title;
  final Widget bottonButton;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      leading: const AppBarLeading(),
      elevation: 2,
      backgroundColor: cBlue.shade700,
      systemOverlayStyle: SystemUiOverlayStyle.light,
      title: AppBarTitle(title: title),
    );
    final positionedContainer = PositionedContainer(bottonButton: bottonButton);
    final height =
        MediaQuery.of(context).size.height - appBar.preferredSize.height;

    return Scaffold(
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
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20.0,
                        vertical: 10.0,
                      ),
                      child: child,
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
