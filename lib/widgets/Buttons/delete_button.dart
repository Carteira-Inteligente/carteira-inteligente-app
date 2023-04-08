import 'package:carteira_inteligente_app/constants/constants.dart';
import 'package:carteira_inteligente_app/utils/show_dialog.dart';
import 'package:carteira_inteligente_app/widgets/Containers/button_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DeleteButton extends StatelessWidget {
  const DeleteButton(this.dataLabel, this.onPressed, {super.key});

  final String dataLabel;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ButtonContainer(
      ElevatedButton.icon(
        icon: SvgPicture.asset(
          sDelete,
          color: cWhite,
        ),
        style: ElevatedButton.styleFrom(
          minimumSize: wSmallButtonMinimunSize,
          shape: wButtonBorderRadius,
          backgroundColor: cRed,
          elevation: 0,
        ),
        onPressed: () => ShowDialog.deleteDialog(context, dataLabel, onPressed),
        label: Text(
          "Excluir",
          style: Theme.of(context).textTheme.labelLarge,
        ),
      ),
    );
  }
}
