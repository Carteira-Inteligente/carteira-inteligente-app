import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../constants/colors.dart';
import '../Labels/input_label.dart';

class ListCard extends StatelessWidget {
  const ListCard({
    super.key,
    required this.svgIcon,
    required this.label,
    required this.onTap,
  });

  final String svgIcon;
  final String label;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: SvgPicture.asset(
        svgIcon,
        color: label == "Excluir conta" ? cRed : cGrey.shade600,
      ),
      title: InputLabel(label: label),
      onTap: onTap,
    );
  }
}
