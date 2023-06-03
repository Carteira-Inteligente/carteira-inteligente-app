import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../constants/colors.dart';
import '../../constants/svgs.dart';
import '../../constants/widgets.dart';
import '../../utils/show_modal.dart';
import '../Containers/button_containers.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.textButton,
    required this.onPressed,
  });

  final String textButton;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ButtonContainer(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: Size(MediaQuery.of(context).size.width * 0.9, 60),
          shape: wButtonBorderRadius,
          backgroundColor: cBlue.shade800,
          elevation: 0,
        ),
        onPressed: onPressed,
        child: Text(
          textButton,
          style: Theme.of(context).textTheme.labelLarge,
        ),
      ),
    );
  }
}

class SmallPrimaryButton extends StatelessWidget {
  const SmallPrimaryButton({
    super.key,
    required this.onPressed,
    required this.backgroundColor,
    required this.label,
  });

  final void Function() onPressed;
  final Color backgroundColor;
  final String label;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: label == "Editar usuário"
            ? null
            : Size(MediaQuery.of(context).size.width * 0.7, 44),
        shape: wButtonBorderRadius,
        backgroundColor: backgroundColor,
        elevation: 0,
      ),
      child: Text(
        label,
        style: const TextStyle(
          color: cWhite,
          fontFamily: "OpenSans",
        ),
      ),
    );
  }
}

class FastEntryButton extends StatelessWidget {
  const FastEntryButton({
    super.key,
    required this.screen,
  });

  final Widget screen;

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: "Novo lançamento rápido",
      child: ElevatedButton(
        onPressed: () => ShowModal.showModal(
          context,
          screen,
        ),
        style: ElevatedButton.styleFrom(
          shape: wButtonBorderRadius,
          backgroundColor: cBlue.shade800,
          elevation: 0,
        ),
        child: SvgPicture.asset(
          sAdd,
          color: cWhite,
        ),
      ),
    );
  }
}
