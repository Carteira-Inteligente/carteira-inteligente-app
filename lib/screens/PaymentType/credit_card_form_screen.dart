import 'package:flutter/material.dart';

import '../../utils/toast_message.dart';
import '../../widgets/Buttons/primary_buttons.dart';
import '../../widgets/Containers/form_containers.dart';
import '../../widgets/Inputs/input_text.dart';

class CreditCardFormScreen extends StatefulWidget {
  const CreditCardFormScreen({
    super.key,
    required this.onSubmit,
  });

  final void Function(
    String,
  ) onSubmit;

  @override
  State<CreditCardFormScreen> createState() => _CreditCardFormScreenState();
}

class _CreditCardFormScreenState extends State<CreditCardFormScreen> {
  final _descriptionController = TextEditingController();

  @override
  void dispose() {
    _descriptionController.dispose();
    super.dispose();
  }

  _submitForm() async {
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
      title: "Novo cartão de crédito",
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
