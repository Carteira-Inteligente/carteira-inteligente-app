import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../constants/colors.dart';
import '../../constants/svgs.dart';
import '../../constants/widgets.dart';
import '../../utils/show_dialog.dart';
import '../Containers/button_containers.dart';

class DeleteButton extends StatelessWidget {
  const DeleteButton({
    super.key,
    required this.dataLabel,
    required this.onPressed,
  });

  final String dataLabel;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ButtonContainer(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: wRoundButtonSize,
          shape: wButtonBorderRadius,
          side: BorderSide(color: cRed.shade800),
          backgroundColor: cWhite,
          elevation: 0,
        ),
        onPressed: () => ShowDialog.deleteDialog(context, dataLabel, onPressed),
        child: SvgPicture.asset(
          sDelete,
          color: cRed.shade800,
        ),
      ),
    );
  }
}
