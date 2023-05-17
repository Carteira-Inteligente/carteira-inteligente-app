import 'package:carteira_inteligente/constants/colors.dart';
import 'package:carteira_inteligente/constants/svgs.dart';
import 'package:carteira_inteligente/utils/format_currency.dart';
import 'package:carteira_inteligente/utils/show_dialog.dart';
import 'package:carteira_inteligente/utils/toast_message.dart';
import 'package:carteira_inteligente/widgets/Containers/card_container.dart';
import 'package:carteira_inteligente/widgets/Containers/rounded_icon_container.dart';
import 'package:carteira_inteligente/widgets/Labels/list_tile_label.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EntryCard extends StatelessWidget {
  const EntryCard(this.onTap, this.categoryIcon, this.categoryColor, this.title,
      this.value, this.dueDate, this.paymentStatus, this.onPressedPayment,
      {super.key});

  final void Function() onTap;
  final String categoryIcon;
  final Color categoryColor;
  final String title;
  final double value;
  final String dueDate;
  final bool paymentStatus;
  final bool onPressedPayment;

  @override
  Widget build(BuildContext context) {
    var formatCurrency = getFormatCurrency();

    return CardContainer(
      ListTile(
        onTap: onTap,
        leading: RoundedIconContainer(
          categoryIcon,
          categoryColor,
          24,
        ),
        title: ListTileLabel(title),
        subtitle: Text(
          "Valor: ${formatCurrency.format(value)}\n"
          "Vencimento: $dueDate",
          style: Theme.of(context).textTheme.displaySmall,
        ),
        trailing: IconButton(
          icon: paymentStatus == true
              ? SvgPicture.asset(
                  sPaymentTick,
                  color: cGreen,
                )
              : SvgPicture.asset(
                  sPaymentWaiting,
                  color: cOrange,
                ),
          onPressed: onPressedPayment == true
              ? () {
                  ShowDialog.cancelPayment(context, () {
                    Navigator.pop(context);
                    ToastMessage.showToast(
                      "Pagamento desfeito com sucesso.",
                    );
                    onPressedPayment == false;
                  });
                }
              : () {
                  ToastMessage.showToast(
                    "Pagamento realizado com sucesso.",
                  );
                  onPressedPayment == true;
                },
        ),
      ),
    );
  }
}
