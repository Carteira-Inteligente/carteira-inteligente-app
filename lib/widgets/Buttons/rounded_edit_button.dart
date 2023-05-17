import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../constants/colors.dart';
import '../../constants/svgs.dart';
import '../../constants/widgets.dart';
import '../Containers/button_container.dart';

class RoundedEditButton extends StatelessWidget {
  const RoundedEditButton(this.onPressed, {super.key});

  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ButtonContainer(
      ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: wRoundButtonSize,
          shape: wButtonBorderRadius,
          backgroundColor: cGrey,
          elevation: 0,
        ),
        onPressed: onPressed,
        child: SvgPicture.asset(
          sEdit,
          color: cWhite,
        ),
      ),
    );
  }
}
