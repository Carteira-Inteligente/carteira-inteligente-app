import 'package:carteira_inteligente_app/widgets/Containers/button_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../constants/constants.dart';

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
            minimumSize: wButtonMinimunSize,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(50),
              ),
            ),
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
