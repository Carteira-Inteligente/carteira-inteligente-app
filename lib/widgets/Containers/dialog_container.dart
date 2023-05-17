import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../Labels/list_tile_label.dart';
import 'divider_container.dart';

class DialogContainer extends StatelessWidget {
  const DialogContainer(this.dialogTitle, this.contentText, this.actionButton,
      this.secondaryButton,
      {super.key});

  final String dialogTitle;
  final Widget contentText;
  final Widget actionButton;
  final Widget secondaryButton;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              ListTileLabel(dialogTitle),
            ],
          ),
          const DividerContainer(),
        ],
      ),
      content: contentText,
      backgroundColor: cWhite,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      actions: <Widget>[
        actionButton,
        secondaryButton,
      ],
    );
  }
}
