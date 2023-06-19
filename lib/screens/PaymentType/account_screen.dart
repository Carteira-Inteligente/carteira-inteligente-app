import 'package:flutter/material.dart';

import '../../constants/svgs.dart';
import '../../models/payment_type.dart';
import '../../services/payment_type_service.dart';
import '../../utils/sort_informations.dart';
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

    final paymentTypes = await PaymentTypeService.findAll("Contas");

    setState(() {
      _isLoading = false;
      _paymentTypes = paymentTypes;
    });

    return paymentTypes;
  }

  _createAccount(String description) async {
    final createdAccount =
        await PaymentTypeService.post(context, description, "ACCOUNT", "Conta");

    setState(() {
      _paymentTypes.add(createdAccount);
    });
  }

  _updateAccount(PaymentType paymentType, String description) async {
    final updatedAccount = await PaymentTypeService.put(
      context,
      paymentType,
      description,
      "ACCOUNT",
      "Conta",
    );

    final index = _paymentTypes.indexWhere(
      (account) => account.id == updatedAccount.id,
    );

    if (index != -1) {
      setState(() {
        _paymentTypes[index] = updatedAccount;
      });
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
            onSubmit: (description) => _updateAccount(paymentType, description),
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
      onPressed: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => AccountFormScreen(onSubmit: _createAccount),
        ),
      ),
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
