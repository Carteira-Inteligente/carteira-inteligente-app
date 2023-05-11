import 'package:carteira_inteligente/constants/constants.dart';
import 'package:carteira_inteligente/widgets/Buttons/primary_button.dart';
import 'package:carteira_inteligente/widgets/Labels/modal_label.dart';
import 'package:flutter/material.dart';

class ModalFormContainer extends StatelessWidget {
  const ModalFormContainer(
      this.label, this.bodyWidget, this.description, this.bottonButton,
      {super.key});

  final String label;
  final Widget bodyWidget;
  final String description;
  final Widget bottonButton;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ModalLabel(label),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.25,
          child: bodyWidget,
        ),
        Column(
          children: [
            ModalLabel(description),
            PrimaryButton(
              wLargeButtonMinimunSize,
              "Salvar",
              () {},
            ),
          ],
        ),
      ],
    );
  }
}
