import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import '../../constants/svgs.dart';
import '../../models/payment_type.dart';
import '../../routes/app_routes.dart';
import '../../utils/toast_message.dart';
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

    final response = await http.get(
      Uri.parse(AppRoutes.paymentTypeRoute),
    );

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final paymentTypes = List<PaymentType>.from(
        jsonData.map((data) => PaymentType.fromJson(data)),
      );

      setState(() {
        _isLoading = false;
        _paymentTypes = paymentTypes;
      });

      return paymentTypes;
    } else {
      throw Exception("Falha ao listar os cartões de crédito.");
    }
  }

  _createCreditCard(String description) async {
    final response = await http.post(
      Uri.parse(AppRoutes.paymentTypeRoute),
      body: json.encode({
        "user": {"id": 1},
        "description": description,
        "type": "CREDIT_CARD",
      }),
      headers: {"Content-Type": "application/json"},
    );

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final createdCreditCard = PaymentType.fromJson(jsonData);

      setState(() {
        _paymentTypes.add(createdCreditCard);
      });

      ToastMessage.successToast("Cartão de crédito criado com sucesso.");
      Navigator.pop(context);
    } else {
      ToastMessage.dangerToast("Falha ao criar o cartão de crédito.");
    }
  }

  _updateCreditCard(PaymentType paymentType, String newDescription) async {
    final updatedCreditCard = PaymentType(
      id: paymentType.id,
      description: newDescription,
      type: "ACCOUNT",
    );

    final response = await http.put(
      Uri.parse("${AppRoutes.paymentTypeRoute}/${paymentType.id}"),
      body: json.encode({
        "user": {"id": 1},
        "description": newDescription,
        "type": "CREDIT_CARD",
      }),
      headers: {"Content-Type": "application/json"},
    );

    if (response.statusCode == 200) {
      setState(() {
        _paymentTypes = _paymentTypes.map((creditCard) {
          if (creditCard.id == updatedCreditCard.id) {
            return updatedCreditCard;
          }
          return paymentType;
        }).toList();
      });

      ToastMessage.successToast("Cartão de crédito atualizado com sucesso.");
      Navigator.pop(context);
    } else {
      ToastMessage.dangerToast("Falha ao atualizar o cartão de crédito.");
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
            onSubmit: (description) {
              _updateCreditCard(paymentType, description);
            },
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
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CreditCardFormScreen(
              onSubmit: _createCreditCard,
            ),
          ),
        );
      },
      child: _isLoading
          ? ProgressIndicatorContainer(visible: _isLoading)
          : RefreshIndicator(
              onRefresh: _fetchCreditCard,
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
            ),
    );
  }
}
