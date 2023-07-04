import 'package:flutter/material.dart';

import '../../data/payment_type_data.dart';
import '../../models/payment_type.dart';
import '../../widgets/Cards/recurrence_card.dart';
import '../../widgets/Containers/divider_container.dart';
import '../../widgets/Containers/header_modal_container.dart';

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
  final List<PaymentType> _paymentOptions = paymentOptions;

  _buildOptionsCard(BuildContext context, PaymentType paymentType) {
    return Column(
      children: <Widget>[
        PeriodCard(
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
        const HeaderModalContainer(
          label: "Selecione o tipo de pagamento",
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.2,
          child: ListView.builder(
            padding: EdgeInsets.zero,
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
