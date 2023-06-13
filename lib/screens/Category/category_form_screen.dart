import 'package:flutter/material.dart';

import '../../utils/toast_message.dart';
import '../../widgets/Buttons/primary_buttons.dart';
import '../../widgets/Containers/form_containers.dart';
import '../../widgets/Inputs/input_text.dart';

class CategoryFormScreen extends StatefulWidget {
  const CategoryFormScreen({
    super.key,
    required this.onSubmit,
  });

  final void Function(String) onSubmit;

  @override
  State<CategoryFormScreen> createState() => _CategoryFormScreenState();
}

class _CategoryFormScreenState extends State<CategoryFormScreen> {
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
      title: "Nova categoria",
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
