import 'package:carteira_inteligente/constants/constants.dart';
import 'package:carteira_inteligente/models/payment_type.dart';
import 'package:carteira_inteligente/widgets/Cards/payment_type_card.dart';
import 'package:carteira_inteligente/widgets/Containers/divider_container.dart';
import 'package:carteira_inteligente/widgets/Labels/modal_label.dart';
import 'package:flutter/material.dart';

class PaymentTypeListScreen extends StatefulWidget {
  const PaymentTypeListScreen({super.key});

  @override
  State<PaymentTypeListScreen> createState() => _PaymentTypeListScreenState();
}

class _PaymentTypeListScreenState extends State<PaymentTypeListScreen> {
  List<PaymentType> _paymentTypes = [
    PaymentType(
      id: 1,
      description: "Carteira",
      type: "ACCOUNT",
    ),
    PaymentType(
      id: 2,
      description: "Sicredi",
      type: "ACCOUNT",
    ),
    PaymentType(
      id: 3,
      description: "Credicard Zero",
      type: "CREDIT_CARD",
    ),
    PaymentType(
      id: 4,
      description: "Nubank",
      type: "CREDIT_CARD",
    ),
    PaymentType(
      id: 5,
      description: "Sicredi",
      type: "CREDIT_CARD",
    ),
  ];

  _buildAccountPaymentCard(BuildContext context, PaymentType paymentType) {
    return PaymentTypeCard(
      paymentType.description,
      paymentType.type == "ACCOUNT" ? sBank : sCards,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const ModalLabel("Selecionar forma de pagamento"),
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
      ],
    );
  }
}
