import 'dart:math';

import 'package:flutter/material.dart';

import '../../constants/svgs.dart';
import '../../data/payment_data.dart';
import '../../models/payment_type.dart';
import '../../widgets/Cards/list_cards.dart';
import '../../widgets/Containers/form_containers.dart';
import 'account_form_screen.dart';
import 'edit_credit_card_form_screen.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  final List<PaymentType> _paymentTypes = paymentTypesList;

  _buildAccountPaymentCard(BuildContext context, PaymentType paymentType) {
    return PaymentTypeListCard(
      type: paymentType.type,
      description: paymentType.description,
      svgIcon: sBank,
      actionButton: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => EditAccountFormScreen(onSubmit: _addAccount),
          ),
        );
      },
    );
  }

  _addAccount(
    String description,
  ) {
    final newAccount = PaymentType(
      id: Random().nextInt(999).toInt(),
      description: description,
      type: "ACCOUNT",
    );

    setState(() {
      _paymentTypes.add(newAccount);
    });

    Future.delayed(const Duration(milliseconds: 500), () {
      Navigator.of(context).pop();
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScreenFormContainer(
      title: "Contas",
      tooltip: "Nova conta",
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AccountFormScreen(onSubmit: _addAccount),
          ),
        );
      },
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: ListView.builder(
          itemCount: _paymentTypes.length,
          itemBuilder: (context, index) {
            final paymentType = _paymentTypes[index];
            if (paymentType.type == "ACCOUNT" || paymentType.type == "WALLET") {
              return _buildAccountPaymentCard(context, paymentType);
            }
            return Container();
          },
        ),
      ),
    );
  }
}
