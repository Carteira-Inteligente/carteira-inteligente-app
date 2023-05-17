import 'package:carteira_inteligente/constants/colors.dart';
import 'package:carteira_inteligente/constants/svgs.dart';
import 'package:carteira_inteligente/constants/widgets.dart';
import 'package:carteira_inteligente/utils/show_dialog.dart';
import 'package:carteira_inteligente/widgets/Containers/button_container.dart';
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
        style: ElevatedButton.styleFrom(
          minimumSize: wSmallButtonMinimunSize,
          shape: wButtonBorderRadius,
          backgroundColor: cRed,
          elevation: 0,
        ),
        onPressed: () => ShowDialog.deleteDialog(context, dataLabel, onPressed),
        icon: SvgPicture.asset(
          sDelete,
          color: cWhite,
        ),
        label: Text(
          "Excluir",
          style: Theme.of(context).textTheme.labelLarge,
        ),
      ),
    );
  }
}
