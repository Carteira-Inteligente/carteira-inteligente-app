import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../constants/svgs.dart';
import '../Containers/rounded_icon_container.dart';

class PaymentTypeCard extends StatelessWidget {
  const PaymentTypeCard({
    super.key,
    required this.onTap,
    required this.description,
    required this.svgIcon,
  });

  final void Function() onTap;
  final String description;
  final String svgIcon;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: RoundedIconContainer(
        svgPicture: description == "Carteira" ? sWallet : svgIcon,
        backgroundColor: cGrey.shade200,
        radius: 24,
      ),
      title: Text(
        description,
        style: Theme.of(context).textTheme.displaySmall,
      ),
    );
  }
}
