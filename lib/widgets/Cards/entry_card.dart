import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../constants/colors.dart';
import '../../constants/svgs.dart';
import '../../utils/format_currency.dart';
import '../../utils/show_dialog.dart';
import '../../utils/toast_message.dart';
import '../Containers/card_container.dart';
import '../Containers/rounded_icon_container.dart';
import '../Labels/list_tile_label.dart';

class EntryCard extends StatelessWidget {
  const EntryCard({
    super.key,
    required this.onTap,
    required this.categoryIcon,
    required this.categoryColor,
    required this.title,
    required this.value,
    required this.dueDate,
    required this.paymentStatus,
    required this.onPressedPayment,
  });

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
      child: ListTile(
        onTap: onTap,
        leading: RoundedIconContainer(
          svgPicture: categoryIcon,
          backgroundColor: categoryColor,
          radius: 24,
        ),
        title: ListTileLabel(label: title),
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
