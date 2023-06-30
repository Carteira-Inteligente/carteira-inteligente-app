import 'package:flutter/material.dart';

import '../../models/category.dart';
import '../../widgets/Buttons/primary_buttons.dart';
import '../../widgets/Containers/form_containers.dart';
import '../../widgets/Inputs/input_text.dart';

class EditCategoryFormScreen extends StatefulWidget {
  const EditCategoryFormScreen({
    super.key,
    required this.category,
    required this.onSubmit,
  });

  final Category category;
  final void Function(String) onSubmit;

  @override
  State<EditCategoryFormScreen> createState() => _EditCategoryFormScreenState();
}

class _EditCategoryFormScreenState extends State<EditCategoryFormScreen> {
  late TextEditingController _descriptionController;

  @override
  void initState() {
    super.initState();
    _descriptionController =
        TextEditingController(text: widget.category.description);
  }

  @override
  void dispose() {
    _descriptionController.dispose();
    super.dispose();
  }

  _submitForm() {
    final description = _descriptionController.text;
    widget.onSubmit(description);
  }

  @override
  Widget build(BuildContext context) {
    return FormContainer(
      title: "Edição de categoria",
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
