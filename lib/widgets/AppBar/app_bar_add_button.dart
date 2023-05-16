import 'package:carteira_inteligente/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppBarAddButton extends StatefulWidget {
  const AppBarAddButton(this.tooltip, this.onPressed, {super.key});

  final String tooltip;
  final void Function() onPressed;

  @override
  State<AppBarAddButton> createState() => _AppBarAddButtonState();
}

class _AppBarAddButtonState extends State<AppBarAddButton> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      tooltip: widget.tooltip,
      onPressed: widget.onPressed,
      icon: SvgPicture.asset(
        sAdd,
        color: cWhite,
      ),
    );
  }
}
