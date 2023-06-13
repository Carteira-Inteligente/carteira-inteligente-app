import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../constants/colors.dart';
import '../../constants/svgs.dart';
import '../Containers/card_container.dart';
import '../Containers/rounded_icon_container.dart';
import '../Labels/input_label.dart';

class ProfileListCard extends StatelessWidget {
  const ProfileListCard({
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
        color: label == "Excluir usuário" ? cRed : cGrey.shade600,
      ),
      title: InputLabel(label: label),
      onTap: onTap,
    );
  }
}

class CategoryListCard extends StatelessWidget {
  const CategoryListCard({
    super.key,
    required this.description,
    required this.onEdit,
  });

  final String description;
  final VoidCallback onEdit;

  @override
  Widget build(BuildContext context) {
    return CardContainer(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: ListTile(
          leading: const RoundedIconContainer(
            svgPicture: sCategory,
            svgColor: Color(0xFF1F70A2),
            backgroundColor: Color(0xFFBED3E7),
            radius: 24,
          ),
          title: Text(
            description,
            style: Theme.of(context).textTheme.displaySmall,
          ),
          trailing: IconButton(
            icon: SvgPicture.asset(
              sEdit,
              color: cGrey.shade600,
            ),
            onPressed: onEdit,
          ),
        ),
      ),
    );
  }
}

class PaymentTypeListCard extends StatelessWidget {
  const PaymentTypeListCard({
    super.key,
    required this.type,
    required this.description,
    required this.svgIcon,
    required this.onEdit,
  });

  final String type;
  final String description;
  final String svgIcon;
  final VoidCallback onEdit;

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
                  onPressed: onEdit,
                ),
        ),
      ),
    );
  }
}
