import 'package:carteira_inteligente/constants/svgs.dart';
import 'package:carteira_inteligente/constants/widgets.dart';
import 'package:carteira_inteligente/data/payment_data.dart';
import 'package:carteira_inteligente/models/payment_type.dart';
import 'package:carteira_inteligente/widgets/Buttons/primary_button.dart';
import 'package:carteira_inteligente/widgets/Cards/payment_type_card.dart';
import 'package:carteira_inteligente/widgets/Containers/divider_container.dart';
import 'package:carteira_inteligente/widgets/Labels/modal_title_label.dart';
import 'package:flutter/material.dart';

class PaymentTypeListScreen extends StatefulWidget {
  const PaymentTypeListScreen(this.onPaymentTypeSelected, {super.key});

  final void Function(String) onPaymentTypeSelected;

  @override
  State<PaymentTypeListScreen> createState() => _PaymentTypeListScreenState();
}

class _PaymentTypeListScreenState extends State<PaymentTypeListScreen> {
  final List<PaymentType> _paymentTypes = paymentTypesList;

  _buildAccountPaymentCard(BuildContext context, PaymentType paymentType) {
    return PaymentTypeCard(
      () {
        widget.onPaymentTypeSelected(paymentType.description);
        Navigator.pop(context);
      },
      paymentType.description,
      paymentType.type == "ACCOUNT" ? sBank : sCards,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const ModalTitleLabel("Selecionar forma de pagamento"),
        SizedBox(
          height: 450,
          child: ListView.builder(
            itemCount: _paymentTypes.length,
            itemBuilder: (context, index) {
              final paymentType = _paymentTypes[index];

              if (index == _paymentTypes.length - 1) {
                return _buildAccountPaymentCard(context, paymentType);
              } else {
                return Column(
                  children: <Widget>[
                    _buildAccountPaymentCard(context, paymentType),
                    const DividerContainer(),
                  ],
                );
              }
            },
          ),
        ),
        PrimaryButton(
          wLargeButtonMinimunSize,
          "Nova forma de pagamento",
          () {},
        ),
      ],
    );
  }
}
