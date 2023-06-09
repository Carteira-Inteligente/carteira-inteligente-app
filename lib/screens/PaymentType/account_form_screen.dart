import 'package:flutter/material.dart';

import '../../widgets/Buttons/primary_buttons.dart';
import '../../widgets/Containers/form_containers.dart';
import '../../widgets/Inputs/input_text.dart';

class AccountFormScreen extends StatefulWidget {
  const AccountFormScreen({
    super.key,
    required this.onSubmit,
  });

  final void Function(
    String,
  ) onSubmit;

  @override
  State<AccountFormScreen> createState() => _AccountFormScreenState();
}

class _AccountFormScreenState extends State<AccountFormScreen> {
  final _descriptionController = TextEditingController();

  @override
  void dispose() {
    _descriptionController.dispose();
    super.dispose();
  }

  _submitForm() async {
    final description = _descriptionController.text;
    widget.onSubmit(description);
  }

  @override
  Widget build(BuildContext context) {
    return FormContainer(
      title: "Nova conta",
      bottomButton: PrimaryButton(
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
