import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../constants/colors.dart';
import '../../constants/svgs.dart';
import '../../constants/widgets.dart';
import '../../utils/show_dialog.dart';
import '../Containers/button_container.dart';

class RoundedDeleteButton extends StatelessWidget {
  const RoundedDeleteButton(this.dataLabel, this.onPressed, {super.key});

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
