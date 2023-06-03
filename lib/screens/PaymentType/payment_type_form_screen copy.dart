import 'package:flutter/material.dart';

import '../../utils/show_modal.dart';
import '../../utils/toast_message.dart';
import '../../widgets/Buttons/primary_buttons.dart';
import '../../widgets/Containers/form_containers.dart';
import '../../widgets/Inputs/input_select.dart';
import '../../widgets/Inputs/input_text.dart';
import 'payment_type_form_list_screen.dart';

class PaymentTypeFormScreen extends StatefulWidget {
  const PaymentTypeFormScreen({
    super.key,
    required this.onSubmit,
  });

  final void Function(
    String,
    String,
  ) onSubmit;

  @override
  State<PaymentTypeFormScreen> createState() => _PaymentTypeFormScreenState();
}

class _PaymentTypeFormScreenState extends State<PaymentTypeFormScreen> {
  String _selectedCategory = "";

  final _paymentTypeController = TextEditingController();
  final _descriptionController = TextEditingController();

  _submitForm() {
    final paymentType = _paymentTypeController.text;
    final description = _descriptionController.text;

    if (paymentType.isEmpty || description.isEmpty) {
      ToastMessage.showToast("Preencha todos os campos obrigatórios.");
      return;
    }

    widget.onSubmit(paymentType, description);
    ToastMessage.showToast("Tipo de pagamento cadastrado com sucesso.");
  }

  @override
  Widget build(BuildContext context) {
    return FormContainer(
      title: "Nova forma de pagamento",
      bottonButton: PrimaryButton(
        textButton: "Salvar",
        onPressed: _submitForm,
      ),
      child: Column(
        children: <Widget>[
          InputSelect(
            label: "Tipo de pagamento",
            controller: _paymentTypeController,
            onTap: () => ShowModal.showModal(
              context,
              PaymentTypeListFormScreen(
                onPaymentTypeSelected: (category) {
                  setState(() {
                    _selectedCategory = category;
                  });
                },
              ),
            ),
            selectedOption: _selectedCategory,
          ),
          InputText(
            label: "Descrição",
            controller: _descriptionController,
            onSubmit: _submitForm,
          ),
        ],
      ),
    );
  }
}
