import 'package:flutter/material.dart';

import '../../constants/svgs.dart';
import '../../models/payment_type.dart';
import '../../services/payment_type_service.dart';
import '../../widgets/Cards/list_cards.dart';
import '../../widgets/Containers/form_containers.dart';
import '../../widgets/Containers/progress_containers.dart';
import 'credit_card_form_screen.dart';
import 'edit_account_form_screen.dart';

class CreditCardScreen extends StatefulWidget {
  const CreditCardScreen({super.key});

  @override
  State<CreditCardScreen> createState() => _CreditCardScreenState();
}

class _CreditCardScreenState extends State<CreditCardScreen> {
  List<PaymentType> _paymentTypes = [];
  bool _isLoading = false;

  Future<List<PaymentType>> _fetchCreditCard() async {
    setState(() {
      _isLoading = true;
    });

    final paymentTypes = await PaymentTypeService.findAll("Cartões de crédito");

    setState(() {
      _isLoading = false;
      _paymentTypes = paymentTypes;
    });

    return paymentTypes;
  }

  _createCreditCard(String description) async {
    final createdCreditCard = await PaymentTypeService.post(
      context,
      description,
      "CREDIT_CARD",
      "Cartão de crédito",
    );

    setState(() {
      _paymentTypes.add(createdCreditCard);
    });
  }

  _updateCreditCard(PaymentType paymentType, String description) async {
    final updatedCreditCard = await PaymentTypeService.put(
      context,
      paymentType,
      description,
      "CREDIT_CARD",
      "Cartão de crédito",
    );

    final index = _paymentTypes.indexWhere(
      (creditCard) => creditCard.id == updatedCreditCard.id,
    );

    if (index != -1) {
      setState(() {
        _paymentTypes[index] = updatedCreditCard;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchCreditCard();
  }

  _buildCreditCardPaymentCard(BuildContext context, PaymentType paymentType) {
    return PaymentTypeListCard(
      type: paymentType.type,
      description: paymentType.description,
      svgIcon: sCards,
      onEdit: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => EditCreditCardFormScreen(
            paymentType: paymentType,
            onSubmit: (description) => _updateCreditCard(
              paymentType,
              description,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ScreenFormContainer(
      title: "Cartões de crédito",
      tooltip: "Novo cartão de crédito",
      onPressed: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CreditCardFormScreen(
            onSubmit: _createCreditCard,
          ),
        ),
      ),
      child: _isLoading
          ? ProgressIndicatorContainer(visible: _isLoading)
          : RefreshIndicator(
              onRefresh: _fetchCreditCard,
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: ListView.builder(
                  padding: EdgeInsets.zero,
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
            ),
    );
  }
}
