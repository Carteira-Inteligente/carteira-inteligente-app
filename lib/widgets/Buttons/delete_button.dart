import 'package:carteira_inteligente_app/widgets/Containers/button_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../constants/constants.dart';

class DeleteButton extends StatelessWidget {
  const DeleteButton(this.onPressed, {super.key});

  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ButtonContainer(
      ElevatedButton.icon(
        icon: SvgPicture.asset(
          sDelete,
          color: cWhite,
        ),
        style: ElevatedButton.styleFrom(
            minimumSize: wButtonMinimunSize,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(50),
              ),
            ),
            backgroundColor: cRed,
            elevation: 0),
        onPressed: onPressed,
        label: Text(
          "Excluir",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
    );
  }
}
