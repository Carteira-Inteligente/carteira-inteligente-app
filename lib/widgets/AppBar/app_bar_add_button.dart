import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../constants/colors.dart';
import '../../constants/svgs.dart';

class AppBarAddButton extends StatefulWidget {
  const AppBarAddButton({
    super.key,
    required this.tooltip,
    required this.onPressed,
    this.blueIcon,
  });

  final String tooltip;
  final void Function() onPressed;
  final bool? blueIcon;

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
        sAddCircle,
        color: widget.blueIcon == true ? cBlue.shade800 : cWhite,
      ),
    );
  }
}
