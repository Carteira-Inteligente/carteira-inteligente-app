import 'package:carteira_inteligente_app/constants/constants.dart';
import 'package:carteira_inteligente_app/widgets/Containers/card_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ListTileCard extends StatelessWidget {
  const ListTileCard(this.onTap, this.pageIcon, this.title, this.subtitle,
      this.paymentStatus, this.onPressedPayment,
      {super.key});

  final void Function() onTap;
  final SvgPicture pageIcon;
  final String title;
  final String subtitle;
  final SvgPicture paymentStatus;
  final void Function() onPressedPayment;

  @override
  Widget build(BuildContext context) {
    return CardContainer(
      ListTile(
        onTap: onTap,
        leading: Container(
          decoration: BoxDecoration(
            borderRadius: wBorderRadius50,
            border: Border.all(color: cGrey.shade300),
          ),
          child: CircleAvatar(
            backgroundColor: cTransparent,
            radius: 24,
            child: Container(
              padding: const EdgeInsets.all(6.0),
              child: pageIcon,
            ),
          ),
        ),
        title: Text(
          title,
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        subtitle: Text(
          subtitle,
          style: Theme.of(context).textTheme.displaySmall,
        ),
        trailing: IconButton(
          icon: paymentStatus,
          onPressed: onPressedPayment,
        ),
      ),
    );
  }
}
