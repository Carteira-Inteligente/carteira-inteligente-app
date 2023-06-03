import 'package:carteira_inteligente/widgets/Labels/subtitle_label.dart';
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
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SubtitleLabel(label: dialogTitle),
        ],
      ),
      content: contentText,
      backgroundColor: cWhite,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      actions: <Widget>[
        const DividerContainer(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(
              children: <Widget>[
                actionButton,
                secondaryButton,
              ],
            ),
          ],
        )
      ],
    );
  }
}
