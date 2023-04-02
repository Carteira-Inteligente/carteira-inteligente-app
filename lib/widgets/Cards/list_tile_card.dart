import 'package:carteira_inteligente_app/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ListTileCard extends StatelessWidget {
  const ListTileCard(
      this.onTap, this.pageIcon, this.title, this.subtitle, this.paymentStatus,
      {super.key});

  final void Function() onTap;
  final SvgPicture pageIcon;
  final String title;
  final String subtitle;
  final SvgPicture paymentStatus;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(
        vertical: 3.0,
        horizontal: 8.0,
      ),
      child: ListTile(
        onTap: onTap,
        leading: Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(
              Radius.circular(50),
            ),
            border: Border.all(color: cGrey.shade300),
          ),
          child: CircleAvatar(
            backgroundColor: cTransparent,
            radius: 24,
            child: Container(
              padding: const EdgeInsets.all(6),
              child: pageIcon,
            ),
          ),
        ),
        title: Text(
          title,
          style: Theme.of(context).textTheme.displayMedium,
        ),
        subtitle: Text(
          subtitle,
          style: Theme.of(context).textTheme.displaySmall,
        ),
        trailing: IconButton(
          icon: paymentStatus,
          onPressed: () {},
        ),
      ),
    );
  }
}
