import 'package:carteira_inteligente/constants/colors.dart';
import 'package:carteira_inteligente/constants/svgs.dart';
import 'package:carteira_inteligente/constants/widgets.dart';
import 'package:carteira_inteligente/utils/show_modal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FastEntryButton extends StatelessWidget {
  const FastEntryButton(this.fastEntryScreen, {super.key});

  final Widget fastEntryScreen;

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: "Novo lançamento rápido",
      child: ElevatedButton(
        onPressed: () => ShowModal.showModal(
          context,
          fastEntryScreen,
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
