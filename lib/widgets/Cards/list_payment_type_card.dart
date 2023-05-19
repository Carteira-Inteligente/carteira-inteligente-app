import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../constants/colors.dart';
import '../../constants/svgs.dart';
import '../Containers/card_container.dart';
import '../Containers/rounded_icon_container.dart';

class ListPaymentTypeCard extends StatelessWidget {
  const ListPaymentTypeCard({
    super.key,
    required this.type,
    required this.description,
    required this.svgIcon,
    required this.actionButton,
  });

  final String type;
  final String description;
  final String svgIcon;
  final void Function() actionButton;

  @override
  Widget build(BuildContext context) {
    return CardContainer(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: ListTile(
          leading: RoundedIconContainer(
            svgPicture: type == "WALLET" ? sWallet : svgIcon,
            backgroundColor: cGrey.shade200,
            radius: 24,
          ),
          title: Text(
            description,
            style: Theme.of(context).textTheme.displaySmall,
          ),
          trailing: type == "WALLET"
              ? null
              : IconButton(
                  icon: SvgPicture.asset(
                    sEdit,
                    color: cGrey.shade600,
                  ),
                  onPressed: actionButton,
                ),
        ),
      ),
    );
  }
}
