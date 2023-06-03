import 'package:flutter/material.dart';

import '../../utils/toast_message.dart';
import '../../widgets/Buttons/primary_buttons.dart';
import '../../widgets/Containers/form_containers.dart';
import '../../widgets/Inputs/input_text.dart';

class EditAccountFormScreen extends StatefulWidget {
  const EditAccountFormScreen({
    super.key,
    required this.onSubmit,
  });

  final void Function(String) onSubmit;

  @override
  State<EditAccountFormScreen> createState() => _EditAccountFormScreenState();
}

class _EditAccountFormScreenState extends State<EditAccountFormScreen> {
  final _descriptionController = TextEditingController();

  _submitForm() {
    final description = _descriptionController.text;

    if (description.isEmpty) {
      ToastMessage.showToast("Preencha todos os campos obrigatórios.");
      return;
    }

    widget.onSubmit(description);
    ToastMessage.showToast("Conta alterada com sucesso.");
  }

  @override
  Widget build(BuildContext context) {
    return FormContainer(
      title: "Edição de conta",
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
