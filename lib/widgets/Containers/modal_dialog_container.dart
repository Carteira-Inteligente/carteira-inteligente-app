import 'package:flutter/material.dart';

import '../../widgets/Buttons/primary_buttons.dart';
import '../Buttons/secondary_buttons.dart';
import 'header_modal_container.dart';

class ModalDialogContainer extends StatelessWidget {
  const ModalDialogContainer({
    super.key,
    required this.title,
    required this.child,
    required this.onPressed,
    required this.textButton,
    this.deleteButton,
  });

  final String title;
  final Widget child;
  final void Function() onPressed;
  final String textButton;
  final bool? deleteButton;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        HeaderModalContainer(
          label: title,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 40.0, horizontal: 8.0),
          child: child,
        ),
        PrimaryButton(
          onPressed: onPressed,
          textButton: textButton,
          deleteButton: deleteButton,
        ),
        SecondaryButton(
          onPressed: () => Navigator.pop(context),
          textButton: "Voltar",
        ),
      ],
    );
  }
}
