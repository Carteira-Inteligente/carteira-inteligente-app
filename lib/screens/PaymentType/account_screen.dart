import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import '../../constants/svgs.dart';
import '../../models/payment_type.dart';
import '../../routes/app_routes.dart';
import '../../services/payment_type_service.dart';
import '../../utils/sort_categories.dart';
import '../../utils/toast_message.dart';
import '../../widgets/Cards/list_cards.dart';
import '../../widgets/Containers/form_containers.dart';
import '../../widgets/Containers/progress_containers.dart';
import 'account_form_screen.dart';
import 'edit_credit_card_form_screen.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  List<PaymentType> _paymentTypes = [];
  bool _isLoading = false;

  Future<List<PaymentType>> _fetchAccounts() async {
    setState(() {
      _isLoading = true;
    });

    final paymentTypes = await PaymentTypeService.findAll();

    setState(() {
      _isLoading = false;
      _paymentTypes = paymentTypes;
    });

    return paymentTypes;
  }

  _createAccount(String description) async {
    final createdAccount = await PaymentTypeService.post(
      context,
      description,
      "ACCOUNT",
    );

    setState(() {
      _paymentTypes.add(createdAccount);
    });
  }

  _updateAccount(PaymentType paymentType, String newDescription) async {
    final updatedAccount = PaymentType(
      id: paymentType.id,
      description: newDescription,
      type: "ACCOUNT",
    );

    final response = await http.put(
      Uri.parse("${AppRoutes.paymentTypeRoute}/${paymentType.id}"),
      body: json.encode({
        "user": {"id": 1},
        "description": newDescription,
        "type": "ACCOUNT",
      }),
      headers: {"Content-Type": "application/json"},
    );

    if (response.statusCode == 200) {
      setState(() {
        _paymentTypes = _paymentTypes.map((account) {
          if (account.id == updatedAccount.id) {
            return updatedAccount;
          }
          return paymentType;
        }).toList();
      });

      ToastMessage.successToast("Conta atualizada com sucesso.");
      Navigator.pop(context);
    } else {
      ToastMessage.dangerToast("Falha ao atualizar a conta.");
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchAccounts();
  }

  _buildAccountPaymentCard(BuildContext context, PaymentType paymentType) {
    return PaymentTypeListCard(
      type: paymentType.type,
      description: paymentType.description,
      svgIcon: sBank,
      onEdit: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => EditAccountFormScreen(
            paymentType: paymentType,
            onSubmit: (description) {
              _updateAccount(paymentType, description);
            },
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    sortAccounts(_paymentTypes);
    return ScreenFormContainer(
      title: "Contas",
      tooltip: "Nova conta",
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AccountFormScreen(onSubmit: _createAccount),
          ),
        );
      },
      child: _isLoading
          ? ProgressIndicatorContainer(visible: _isLoading)
          : RefreshIndicator(
              onRefresh: _fetchAccounts,
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: ListView.builder(
                  itemCount: _paymentTypes.length,
                  itemBuilder: (context, index) {
                    final paymentType = _paymentTypes[index];
                    if (paymentType.type == "ACCOUNT" ||
                        paymentType.type == "WALLET") {
                      return _buildAccountPaymentCard(context, paymentType);
                    }
                    return Container();
                  },
                ),
              ),
            ),
    );
  }
}
