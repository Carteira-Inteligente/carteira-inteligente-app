import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../constants/colors.dart';
import '../../constants/svgs.dart';
import '../../constants/widgets.dart';
import '../Containers/button_container.dart';

class EditButton extends StatelessWidget {
  const EditButton(this.onPressed, {super.key});

  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ButtonContainer(
      ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          minimumSize: Size(MediaQuery.of(context).size.width * 0.4, 60),
          shape: wButtonBorderRadius,
          backgroundColor: cGrey,
          elevation: 0,
        ),
        onPressed: onPressed,
        icon: SvgPicture.asset(
          sEdit,
          color: cWhite,
        ),
        label: Text(
          "Editar",
          style: Theme.of(context).textTheme.labelLarge,
        ),
      ),
    );
  }
}
