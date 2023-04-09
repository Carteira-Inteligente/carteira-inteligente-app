import 'package:carteira_inteligente/constants/constants.dart';
import 'package:carteira_inteligente/widgets/Containers/button_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EditButton extends StatelessWidget {
  const EditButton(this.onPressed, {super.key});

  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ButtonContainer(
      ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: Size(60, 60),
          shape: wButtonBorderRadius,
          backgroundColor: cGrey,
          elevation: 0,
        ),
        onPressed: onPressed,
        child: SvgPicture.asset(
          sEdit,
          color: cWhite,
        ),
        // label: Text(
        //   "Editar",
        //   style: Theme.of(context).textTheme.labelLarge,
      ),
    );
  }
}
