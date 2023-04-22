import 'package:carteira_inteligente/constants/constants.dart';
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
      ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: wRoundButtonSize,
          shape: wButtonBorderRadius,
          backgroundColor: cRed,
          elevation: 0,
        ),
        onPressed: () => ShowDialog.deleteDialog(context, dataLabel, onPressed),
        child: SvgPicture.asset(
          sDelete,
          color: cWhite,
        ),
      ),
    );
  }
}
