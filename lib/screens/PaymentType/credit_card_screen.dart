import 'dart:math';

import 'package:flutter/material.dart';

import '../../constants/svgs.dart';
import '../../data/payment_data.dart';
import '../../models/payment_type.dart';
import '../../widgets/Cards/list_payment_type_card.dart';
import '../../widgets/Containers/screen_form_container.dart';
import 'credit_card_form_screen.dart';
import 'edit_account_form_screen.dart';

class CreditCardScreen extends StatefulWidget {
  const CreditCardScreen({super.key});

  @override
  State<CreditCardScreen> createState() => _CreditCardScreenState();
}

class _CreditCardScreenState extends State<CreditCardScreen> {
  final List<PaymentType> _paymentTypes = paymentTypesList;

  _buildCreditCardPaymentCard(BuildContext context, PaymentType paymentType) {
    return ListPaymentTypeCard(
      type: paymentType.type,
      description: paymentType.description,
      svgIcon: sCards,
      actionButton: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => EditCreditCardFormScreen(
              onSubmit: _addCreditCard,
            ),
          ),
        );
      },
    );
  }

  _addCreditCard(
    String description,
  ) {
    final newCreditCard = PaymentType(
      id: Random().nextInt(999).toInt(),
      description: description,
      type: "CREDIT_CARD",
    );

    setState(() {
      _paymentTypes.add(newCreditCard);
    });

    Future.delayed(const Duration(milliseconds: 500), () {
      Navigator.of(context).pop();
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScreenFormContainer(
      title: "Cartões de crédito",
      tooltip: "Novo cartão de crédito",
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CreditCardFormScreen(
              onSubmit: _addCreditCard,
            ),
          ),
        );
      },
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: ListView.builder(
          itemCount: _paymentTypes.length,
          itemBuilder: (context, index) {
            final paymentType = _paymentTypes[index];
            if (paymentType.type == "CREDIT_CARD") {
              return _buildCreditCardPaymentCard(context, paymentType);
            }
            return Container();
          },
        ),
      ),
    );
  }
}
