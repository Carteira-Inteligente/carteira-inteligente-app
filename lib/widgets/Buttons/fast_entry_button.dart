import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../constants/colors.dart';
import '../../constants/svgs.dart';
import '../../constants/widgets.dart';
import '../../utils/show_modal.dart';

class FastEntryButton extends StatelessWidget {
  const FastEntryButton({
    super.key,
    required this.fastEntryScreen,
  });

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
