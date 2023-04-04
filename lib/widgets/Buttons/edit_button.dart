import 'package:carteira_inteligente_app/constants/constants.dart';
import 'package:carteira_inteligente_app/widgets/Containers/button_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EditButton extends StatelessWidget {
  const EditButton(this.onPressed, {super.key});

  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ButtonContainer(
      ElevatedButton.icon(
        icon: SvgPicture.asset(
          sEdit,
          color: cWhite,
        ),
        style: ElevatedButton.styleFrom(
            minimumSize: wSmallButtonMinimunSize,
            shape: wButtonBorderRadius,
            backgroundColor: cGrey,
            elevation: 0),
        onPressed: onPressed,
        label: Text(
          "Editar",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
    );
  }
}
