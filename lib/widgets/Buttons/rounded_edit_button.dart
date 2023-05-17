import 'package:carteira_inteligente/constants/colors.dart';
import 'package:carteira_inteligente/constants/svgs.dart';
import 'package:carteira_inteligente/constants/widgets.dart';
import 'package:carteira_inteligente/widgets/Containers/button_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
