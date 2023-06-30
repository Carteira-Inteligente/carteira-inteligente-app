import 'package:carteira_inteligente/screens/Modals/cancel_payment_modal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../constants/colors.dart';
import '../../constants/svgs.dart';
import '../../utils/format_currency.dart';
import '../../utils/show_modal.dart';
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
    required this.paidDate,
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
  final String paidDate;
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
          paid == true
              ? "Valor: ${formatCurrency.format(paidValue)}\n"
                  "Pagamento: $paidDate"
              : "Valor: ${formatCurrency.format(paidValue)}\n"
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
          onPressed: paid == false
              ? () => onPay(!paid)
              : () => ShowModal.showModal(
                    context,
                    CancelPaymentModal(
                      onPressed: () {
                        Navigator.pop(context);
                        onPay(!paid);
                      },
                    ),
                  ),
        ),
      ),
    );
  }
}
