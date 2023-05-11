import 'package:carteira_inteligente/widgets/Containers/card_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EntryCard extends StatelessWidget {
  const EntryCard(this.onTap, this.pageIcon, this.title, this.subtitle,
      this.paymentStatus, this.onPressedPayment,
      {super.key});

  final void Function() onTap;
  final Widget pageIcon;
  final String title;
  final String subtitle;
  final SvgPicture paymentStatus;
  final void Function() onPressedPayment;

  @override
  Widget build(BuildContext context) {
    return CardContainer(
      ListTile(
        onTap: onTap,
        leading: pageIcon,
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
