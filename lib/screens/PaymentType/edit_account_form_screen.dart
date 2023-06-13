import 'package:flutter/material.dart';

import '../../models/payment_type.dart';
import '../../utils/toast_message.dart';
import '../../widgets/Buttons/primary_buttons.dart';
import '../../widgets/Containers/form_containers.dart';
import '../../widgets/Inputs/input_text.dart';

class EditCreditCardFormScreen extends StatefulWidget {
  const EditCreditCardFormScreen({
    super.key,
    required this.paymentType,
    required this.onSubmit,
  });

  final PaymentType paymentType;
  final void Function(String) onSubmit;

  @override
  State<EditCreditCardFormScreen> createState() =>
      _EditCreditCardFormScreenState();
}

class _EditCreditCardFormScreenState extends State<EditCreditCardFormScreen> {
  late TextEditingController _descriptionController;

  @override
  void initState() {
    super.initState();
    _descriptionController =
        TextEditingController(text: widget.paymentType.description);
  }

  @override
  void dispose() {
    _descriptionController.dispose();
    super.dispose();
  }

  _submitForm() {
    final description = _descriptionController.text;

    if (description.isEmpty) {
      ToastMessage.warningToast("Preencha todos os campos obrigatórios.");
      return;
    }

    widget.onSubmit(description);
  }

  @override
  Widget build(BuildContext context) {
    return FormContainer(
      title: "Edição de cartão de crédito",
      bottonButton: PrimaryButton(
        textButton: "Salvar",
        onPressed: _submitForm,
      ),
      child: Column(
        children: <Widget>[
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
