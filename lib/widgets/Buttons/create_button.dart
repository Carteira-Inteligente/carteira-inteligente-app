import 'package:carteira_inteligente_app/constants/constants.dart';
import 'package:carteira_inteligente_app/widgets/Containers/button_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CreateButton extends StatelessWidget {
  const CreateButton(this.onPressed, {super.key});

  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ButtonContainer(
      ElevatedButton.icon(
        icon: SvgPicture.asset(
          sAdd,
          color: cWhite,
        ),
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(170, 60),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(50),
            ),
          ),
          backgroundColor: cGreen,
          elevation: 0,
        ),
        onPressed: onPressed,
        label: Text(
          "Salvar",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
    );
  }
}
