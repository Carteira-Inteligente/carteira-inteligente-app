import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../Labels/list_tile_label.dart';
import 'divider_container.dart';

class DialogContainer extends StatelessWidget {
  const DialogContainer({
    super.key,
    required this.dialogTitle,
    required this.contentText,
    required this.actionButton,
    required this.secondaryButton,
  });

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
              ListTileLabel(label: dialogTitle),
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
