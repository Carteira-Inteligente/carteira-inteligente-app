import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../constants/colors.dart';
import '../../constants/svgs.dart';
import '../../constants/widgets.dart';
import '../../utils/show_dialog.dart';
import '../Containers/button_container.dart';

class RoundedDeleteButton extends StatelessWidget {
  const RoundedDeleteButton({
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
