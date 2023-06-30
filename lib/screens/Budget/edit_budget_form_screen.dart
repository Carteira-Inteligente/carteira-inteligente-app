import 'package:flutter/material.dart';

import '../../models/budget.dart';
import '../../utils/show_modal.dart';
import '../../utils/toast_message.dart';
import '../../widgets/Buttons/primary_buttons.dart';
import '../../widgets/Containers/form_containers.dart';
import '../../widgets/Inputs/input_value.dart';
import '../../widgets/Inputs/input_select.dart';
import '../Modals/category_modal.dart';

class EditBudgetFormScreen extends StatefulWidget {
  const EditBudgetFormScreen({
    super.key,
    required this.budget,
    required this.onSubmit,
  });

  final Budget budget;
  final void Function(Budget, int, String, double) onSubmit;

  @override
  State<EditBudgetFormScreen> createState() => _EditBudgetFormScreenState();
}

class _EditBudgetFormScreenState extends State<EditBudgetFormScreen> {
  late String _selectedDescription;
  late double _selectedValue;
  int _selectedId = 0;

  final _idCategoryController = TextEditingController();
  final _valueController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _selectedId = widget.budget.category.id;
    _selectedDescription = widget.budget.category.description;
    _selectedValue = widget.budget.value;
    _valueController.text =
        _selectedValue.toStringAsFixed(2).replaceAll(".", ",");
  }

  @override
  void dispose() {
    _idCategoryController.dispose();
    _valueController.dispose();
    super.dispose();
  }

  _submitForm() {
    final description = _selectedDescription;
    final value = _valueController.text.replaceAll(",", ".");

    if (_selectedId.isNaN || description.isEmpty || value.isEmpty) {
      ToastMessage.warningToast("Preencha todos os campos obrigatórios.");
      return;
    }

    widget.onSubmit(
      widget.budget,
      _selectedId,
      description,
      double.parse(value),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FormContainer(
      title: "Edição de orçamento",
      bottomButton: PrimaryButton(
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
