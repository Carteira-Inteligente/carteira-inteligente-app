import 'package:flutter/material.dart';

import '../../models/payment_type.dart';
import '../../widgets/Cards/recurrence_card.dart';
import '../../widgets/Containers/divider_container.dart';
import '../../widgets/Labels/modal_title_label.dart';

class PaymentTypeModal extends StatefulWidget {
  const PaymentTypeModal({
    super.key,
    required this.onSelected,
  });

  final void Function(String, String) onSelected;

  @override
  State<PaymentTypeModal> createState() => _PaymentTypeModalState();
}

class _PaymentTypeModalState extends State<PaymentTypeModal> {
  final List<PaymentType> _paymentOptions = [
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

  _buildOptionsCard(BuildContext context, PaymentType paymentType) {
    return Column(
      children: <Widget>[
        RecurrenceCard(
          onTap: () {
            widget.onSelected(paymentType.description, paymentType.type);
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
          height: MediaQuery.of(context).size.height * 0.2,
          child: ListView.builder(
            itemCount: _paymentOptions.length,
            itemBuilder: (context, index) {
              final paymentType = _paymentOptions[index];
              return _buildOptionsCard(context, paymentType);
            },
          ),
        ),
      ],
    );
  }
}
