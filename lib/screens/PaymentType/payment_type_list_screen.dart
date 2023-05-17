import 'package:flutter/material.dart';

import '../../constants/svgs.dart';
import '../../data/payment_data.dart';
import '../../models/payment_type.dart';
import '../../widgets/Buttons/primary_button.dart';
import '../../widgets/Cards/payment_type_card.dart';
import '../../widgets/Containers/divider_container.dart';
import '../../widgets/Labels/modal_title_label.dart';

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
          "Nova forma de pagamento",
          () {},
        ),
      ],
    );
  }
}
