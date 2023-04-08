import 'package:carteira_inteligente_app/constants/constants.dart';
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
        children: [
          Text(
            dialogTitle,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const Divider(color: cGrey),
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
