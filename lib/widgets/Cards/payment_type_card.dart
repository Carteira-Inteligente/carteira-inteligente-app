import 'package:carteira_inteligente/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PaymentTypeCard extends StatelessWidget {
  const PaymentTypeCard(this.description, this.svgIcon, {super.key});

  final String description;
  final String svgIcon;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        decoration: const BoxDecoration(borderRadius: wBorderRadius50),
        child: CircleAvatar(
          backgroundColor: cGrey.shade200,
          radius: 24,
          child: Container(
            padding: const EdgeInsets.all(6.0),
            child: SvgPicture.asset(
              description == "Carteira" ? sWallet : svgIcon,
            ),
          ),
        ),
      ),
      title: Text(
        description,
        style: Theme.of(context).textTheme.displaySmall,
      ),
    );
  }
}
