import 'package:flutter/material.dart';

import '../../models/payment_type.dart';
import '../../widgets/Cards/recurrence_card.dart';
import '../../widgets/Containers/divider_container.dart';
import '../../widgets/Labels/modal_title_label.dart';

class PaymentTypeListFormScreen extends StatefulWidget {
  const PaymentTypeListFormScreen({
    super.key,
    required this.onPaymentTypeSelected,
  });

  final void Function(String) onPaymentTypeSelected;

  @override
  State<PaymentTypeListFormScreen> createState() =>
      _PaymentTypeListFormScreenState();
}

class _PaymentTypeListFormScreenState extends State<PaymentTypeListFormScreen> {
  final List<PaymentType> _paymentTypes = [
    PaymentType(
      id: 1,
      description: "Conta",
      type: "ACCOUNT",
    ),
    PaymentType(
      id: 2,
      description: "Cartão de crédito",
      type: "CREDIT_CARD",
    ),
  ];

  _buildRecurrenceCard(BuildContext context, PaymentType paymentType) {
    return Column(
      children: <Widget>[
        RecurrenceCard(
          onTap: () {
            widget.onPaymentTypeSelected(paymentType.description);
            Navigator.pop(context);
          },
          description: paymentType.description,
        ),
        const DividerContainer(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const ModalTitleLabel(label: "Selecione o tipo de pagamento"),
        SizedBox(
          height: 200,
          child: ListView.builder(
            itemCount: _paymentTypes.length,
            itemBuilder: (context, index) {
              final paymentType = _paymentTypes[index];
              return _buildRecurrenceCard(context, paymentType);
            },
          ),
        ),
      ],
    );
  }
}
