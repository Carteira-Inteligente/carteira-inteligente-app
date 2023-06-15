import 'package:flutter/material.dart';

import '../../utils/show_modal.dart';
import '../../utils/toast_message.dart';
import '../../widgets/Buttons/primary_buttons.dart';
import '../../widgets/Containers/form_containers.dart';
import '../../widgets/Inputs/input_value.dart';
import '../../widgets/Inputs/input_select.dart';
import '../Modals/category_modal.dart';

class BudgetFormScreen extends StatefulWidget {
  const BudgetFormScreen({
    super.key,
    required this.onSubmit,
  });

  final void Function(int, String, double) onSubmit;

  @override
  State<BudgetFormScreen> createState() => _BudgetFormScreenState();
}

class _BudgetFormScreenState extends State<BudgetFormScreen> {
  String _selectedDescription = "";
  int _selectedId = 0;

  final _idCategoryController = TextEditingController();
  final _valueController = TextEditingController();

  _submitForm() {
    final idCategory = _selectedId;
    final description = _selectedDescription;
    final value = _valueController.text.replaceAll(",", ".");

    if (idCategory.isNaN || description.isEmpty || value.isEmpty) {
      ToastMessage.warningToast("Preencha todos os campos obrigatórios.");
      return;
    }

    widget.onSubmit(idCategory, description, double.parse(value));
  }

  @override
  Widget build(BuildContext context) {
    return FormContainer(
      title: "Novo orçamento",
      bottonButton: PrimaryButton(
        textButton: "Salvar",
        onPressed: _submitForm,
      ),
      child: Column(
        children: <Widget>[
          InputSelect(
            label: "Categoria",
            controller: _idCategoryController,
            onTap: () => ShowModal.showModal(
              context,
              CategoryModal(
                onSelected: (category, categoryId) {
                  setState(() {
                    _selectedDescription = category;
                    _selectedId = categoryId;
                  });
                },
              ),
            ),
            selectedOption: _selectedDescription,
          ),
          InputValue(
            label: "Valor limite",
            controller: _valueController,
            onSubmit: _submitForm,
          ),
        ],
      ),
    );
  }
}
