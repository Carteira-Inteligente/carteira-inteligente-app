import 'package:carteira_inteligente/constants/constants.dart';
import 'package:carteira_inteligente/widgets/Containers/divider_container.dart';
import 'package:flutter/material.dart';

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
            children: [
              Text(
                dialogTitle,
                style: Theme.of(context).textTheme.titleMedium,
              ),
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
