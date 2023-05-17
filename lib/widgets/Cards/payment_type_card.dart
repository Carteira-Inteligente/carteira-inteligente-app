import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../constants/svgs.dart';
import '../Containers/rounded_icon_container.dart';

class PaymentTypeCard extends StatelessWidget {
  const PaymentTypeCard(this.onTap, this.description, this.svgIcon,
      {super.key});

  final void Function() onTap;
  final String description;
  final String svgIcon;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: RoundedIconContainer(
        description == "Carteira" ? sWallet : svgIcon,
        cGrey.shade200,
        24,
      ),
      title: Text(
        description,
        style: Theme.of(context).textTheme.displaySmall,
      ),
    );
  }
}
