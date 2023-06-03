import 'dart:math';

import 'package:carteira_inteligente/screens/PaymentType/payment_type_form_screen%20copy.dart';
import 'package:flutter/material.dart';

import '../../constants/svgs.dart';
import '../../data/payment_data.dart';
import '../../models/payment_type.dart';
import '../../widgets/Buttons/primary_buttons.dart';
import '../../widgets/Cards/payment_type_card.dart';
import '../../widgets/Containers/divider_container.dart';
import '../../widgets/Labels/modal_title_label.dart';
import '../../widgets/Labels/payment_type_title_label.dart';

class PaymentTypeListScreen extends StatefulWidget {
  const PaymentTypeListScreen({
    super.key,
    required this.onPaymentTypeSelected,
  });

  final void Function(String) onPaymentTypeSelected;

  @override
  State<PaymentTypeListScreen> createState() => _PaymentTypeListScreenState();
}

class _PaymentTypeListScreenState extends State<PaymentTypeListScreen> {
  final List<PaymentType> _paymentTypes = paymentTypesList;

  _buildAccountPaymentCard(BuildContext context, PaymentType paymentType) {
    return Column(
      children: <Widget>[
        PaymentTypeCard(
          type: paymentType.type,
          onTap: () {
            widget.onPaymentTypeSelected(paymentType.description);
            Navigator.pop(context);
          },
          description: paymentType.description,
          svgIcon: paymentType.type == "ACCOUNT" ? sBank : sCards,
        ),
        const DividerContainer(),
      ],
    );
  }

  _addPaymentType(
    String description,
    String type,
  ) {
    final newPaymentType = PaymentType(
      id: Random().nextInt(999).toInt(),
      description: description,
      type: type,
    );

    setState(() {
      _paymentTypes.add(newPaymentType);
    });

    Future.delayed(const Duration(milliseconds: 500), () {
      Navigator.of(context).pop();
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isAccountLabelDisplayed = false;
    bool isCreditCardLabelDisplayed = false;

    return Column(
      children: <Widget>[
        const ModalTitleLabel(label: "Selecione a forma de pagamento"),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.5,
          child: ListView.builder(
            itemCount: _paymentTypes.length,
            itemBuilder: (context, index) {
              final paymentType = _paymentTypes[index];

              if (paymentType.type == "ACCOUNT" ||
                  paymentType.type == "WALLET") {
                if (!isAccountLabelDisplayed) {
                  isAccountLabelDisplayed = true;
                  return Column(
                    children: [
                      const PaymentTypeTitleLabel(label: "Contas"),
                      _buildAccountPaymentCard(context, paymentType),
                    ],
                  );
                } else {
                  return _buildAccountPaymentCard(context, paymentType);
                }
              } else if (paymentType.type == "CREDIT_CARD") {
                if (!isCreditCardLabelDisplayed) {
                  isCreditCardLabelDisplayed = true;
                  return Column(
                    children: [
                      const PaymentTypeTitleLabel(label: "Cartões de crédito"),
                      _buildAccountPaymentCard(context, paymentType),
                    ],
                  );
                } else {
                  return _buildAccountPaymentCard(context, paymentType);
                }
              }
              return Container();
            },
          ),
        ),
        PrimaryButton(
          textButton: "Nova forma de pagamento",
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PaymentTypeFormScreen(
                  onSubmit: _addPaymentType,
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
