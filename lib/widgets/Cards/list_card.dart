import 'package:carteira_inteligente/constants/colors.dart';
import 'package:carteira_inteligente/widgets/Labels/input_label.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ListCard extends StatelessWidget {
  const ListCard(this.svgIcon, this.label, this.onTap, {super.key});

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
      title: InputLabel(label),
      onTap: onTap,
    );
  }
}
