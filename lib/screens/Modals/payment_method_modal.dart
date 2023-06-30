import 'package:flutter/material.dart';

import '../../constants/svgs.dart';
import '../../models/payment_type.dart';
import '../../services/payment_type_service.dart';
import '../../utils/sort_informations.dart';
import '../../widgets/Buttons/primary_buttons.dart';
import '../../widgets/Cards/payment_type_card.dart';
import '../../widgets/Containers/divider_container.dart';
import '../../widgets/Containers/header_modal_container.dart';
import '../../widgets/Containers/progress_containers.dart';
import '../../widgets/Labels/subtitle_labels.dart';
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

    _accounts.clear();
    _creditCards.clear();

    final paymentTypes = await PaymentTypeService.findAll(
      "Formas de pagamento",
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
  }

  _createPaymentType(String description, String type) async {
    final createdPaymentType = await PaymentTypeService.post(
      context,
      description,
      type,
      "Forma de pagamento",
    );

    setState(() {
      _paymentTypes.add(createdPaymentType);
    });
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
        const HeaderModalContainer(
          label: "Selecione a forma de pagamento",
        ),
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
                        children: <Widget>[
                          const SubtitleListLabel(label: "Contas"),
                          ..._accounts.map(
                            (paymentType) => _buildPaymentMethodCard(
                              context,
                              paymentType,
                            ),
                          ),
                        ],
                      );
                    } else if (_creditCards.isNotEmpty &&
                        index == _accounts.length) {
                      sortDecriptions(_creditCards);
                      return Column(
                        children: <Widget>[
                          const SubtitleListLabel(
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
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PaymentTypeFormScreen(
                onSubmit: _createPaymentType,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
