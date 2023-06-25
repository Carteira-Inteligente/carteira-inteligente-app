import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../constants/colors.dart';
import '../../constants/svgs.dart';
import '../../constants/widgets.dart';
import '../Containers/button_containers.dart';

class EditButton extends StatelessWidget {
  const EditButton({
    super.key,
    required this.onPressed,
  });

  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ButtonContainer(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: wRoundButtonSize,
          shape: wButtonBorderRadius,
          side: BorderSide(color: cGrey.shade800),
          backgroundColor: cWhite,
          elevation: 0,
        ),
        onPressed: onPressed,
        child: SvgPicture.asset(
          sEdit,
          color: cGrey.shade800,
        ),
      ),
    );
  }
}
