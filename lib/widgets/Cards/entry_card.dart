import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../constants/colors.dart';
import '../../constants/svgs.dart';
import '../../constants/widgets.dart';
import '../../utils/format_currency.dart';
import '../Containers/button_containers.dart';
import '../Containers/card_container.dart';
import '../Containers/rounded_icon_container.dart';
import '../Labels/list_tile_label.dart';

class EntryCard extends StatelessWidget {
  const EntryCard({
    super.key,
    required this.onTap,
    required this.pathIcon,
    required this.backgroundColor,
    required this.iconColor,
    required this.description,
    required this.paidValue,
    required this.dueDate,
    required this.paid,
    required this.onPay,
  });

  final void Function() onTap;
  final String pathIcon;
  final Color iconColor;
  final Color backgroundColor;
  final String description;
  final double paidValue;
  final String dueDate;
  final bool paid;
  final void Function(bool paid) onPay;

  @override
  Widget build(BuildContext context) {
    var formatCurrency = getFormatCurrency();

    return CardContainer(
      child: ListTile(
        onTap: onTap,
        leading: RoundedIconContainer(
          pathIcon: pathIcon,
          iconColor: iconColor,
          backgroundColor: backgroundColor,
          radius: 24,
        ),
        title: ListTileLabel(label: description),
        subtitle: Text(
          "Valor: ${formatCurrency.format(paidValue)}\n"
          "Vencimento: $dueDate",
          style: Theme.of(context).textTheme.displaySmall,
        ),
        trailing: IconButton(
          icon: paid == true
              ? SvgPicture.asset(
                  sPaymentTick,
                  color: cGreen,
                )
              : SvgPicture.asset(
                  sPaymentWaiting,
                  color: cOrange,
                ),
          onPressed: () => onPay(!paid),
        ),
      ),
    );
  }
}
