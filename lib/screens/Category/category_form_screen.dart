import 'package:carteira_inteligente/providers/categories.dart';
import 'package:flutter/material.dart';

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

  _submitForm() async {
    CategoriesProvider.createCategory(_descriptionController);
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
