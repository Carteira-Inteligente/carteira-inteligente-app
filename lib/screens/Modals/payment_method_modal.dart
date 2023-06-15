import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import '../../constants/svgs.dart';
import '../../models/payment_type.dart';
import '../../routes/app_routes.dart';
import '../../utils/sort_categories.dart';
import '../../utils/toast_message.dart';
import '../../widgets/Buttons/primary_buttons.dart';
import '../../widgets/Cards/payment_type_card.dart';
import '../../widgets/Containers/divider_container.dart';
import '../../widgets/Containers/progress_containers.dart';
import '../../widgets/Labels/modal_title_label.dart';
import '../../widgets/Labels/payment_type_title_label.dart';
import '../PaymentType/payment_type_form_screen.dart';

class PaymentMethodModal extends StatefulWidget {
  const PaymentMethodModal({
    super.key,
    required this.onSelected,
  });

  final void Function(String, int) onSelected;

  @override
  State<PaymentMethodModal> createState() => _PaymentMethodModalState();
}

class _PaymentMethodModalState extends State<PaymentMethodModal> {
  List<PaymentType> _paymentTypes = [];
  final List<PaymentType> _accounts = [];
  final List<PaymentType> _creditCards = [];
  bool _isLoading = false;

  Future<List<PaymentType>> _fetchPaymentTypes() async {
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

      _accounts.addAll(
        paymentTypes.where(
          (paymentType) =>
              paymentType.type == "ACCOUNT" || paymentType.type == "WALLET",
        ),
      );

      _creditCards.addAll(
        paymentTypes.where(
          (paymentType) => paymentType.type == "CREDIT_CARD",
        ),
      );

      setState(() {
        _isLoading = false;
        _paymentTypes = paymentTypes;
      });

      return paymentTypes;
    } else {
      throw Exception("Falha ao listar os tipos de pagamento.");
    }
  }

  _createPaymentType(String description, String type) async {
    final response = await http.post(
      Uri.parse(AppRoutes.paymentTypeRoute),
      body: json.encode({
        "user": {"id": 1},
        "description": description,
        "type": type,
      }),
      headers: {"Content-Type": "application/json"},
    );

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final createdPaymentType = PaymentType.fromJson(jsonData);

      setState(() {
        _paymentTypes.add(createdPaymentType);
      });

      ToastMessage.successToast("Tipo de pagamento criado com sucesso.");
      Navigator.pop(context);
    } else {
      ToastMessage.dangerToast("Falha ao criar o tipo de pagamento.");
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchPaymentTypes();
  }

  _buildPaymentMethodCard(BuildContext context, PaymentType paymentType) {
    return Column(
      children: <Widget>[
        PaymentTypeCard(
          type: paymentType.type,
          onTap: () {
            widget.onSelected(paymentType.description, paymentType.id);
            Navigator.pop(context);
          },
          description: paymentType.description,
          svgIcon: paymentType.type == "ACCOUNT" ? sBank : sCards,
        ),
        const DividerContainer(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const ModalTitleLabel(label: "Selecione a forma de pagamento"),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.5,
          child: _isLoading
              ? ProgressIndicatorContainer(visible: _isLoading)
              : ListView.builder(
                  itemCount: _paymentTypes.length,
                  itemBuilder: (context, index) {
                    if (index == 0 && _accounts.isNotEmpty) {
                      sortAccounts(_accounts);
                      return Column(
                        children: [
                          const PaymentTypeTitleLabel(label: "Contas"),
                          ..._accounts.map(
                            (paymentType) => _buildPaymentMethodCard(
                              context,
                              paymentType,
                            ),
                          ),
                        ],
                      );
                    } else if (_creditCards.isNotEmpty &&
                        index == _accounts.length + 1) {
                      sortDecriptions(_creditCards);
                      return Column(
                        children: [
                          const PaymentTypeTitleLabel(
                            label: "Cartões de crédito",
                          ),
                          ..._creditCards.map(
                            (paymentType) => _buildPaymentMethodCard(
                              context,
                              paymentType,
                            ),
                          ),
                        ],
                      );
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
                  onSubmit: _createPaymentType,
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
