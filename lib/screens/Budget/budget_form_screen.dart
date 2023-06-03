import 'package:flutter/material.dart';

import '../../utils/show_modal.dart';
import '../../utils/toast_message.dart';
import '../../widgets/Buttons/primary_buttons.dart';
import '../../widgets/Containers/form_containers.dart';
import '../../widgets/Inputs/input_value.dart';
import '../../widgets/Inputs/input_select.dart';
import '../Category/category_list_screen.dart';

class BudgetFormScreen extends StatefulWidget {
  const BudgetFormScreen({
    super.key,
    required this.onSubmit,
  });

  final void Function(
    int,
    int,
    double,
  ) onSubmit;

  @override
  State<BudgetFormScreen> createState() => _BudgetFormScreenState();
}

class _BudgetFormScreenState extends State<BudgetFormScreen> {
  String _selectedCategory = "";

  final _idUsercontroller = TextEditingController();
  final _idCategoryController = TextEditingController();
  final _valueController = TextEditingController();

  _submitForm() {
    final idUser = _idUsercontroller.text;
    final idCategory = _idCategoryController.text;
    final value = _valueController.text;

    if (idUser.isEmpty || idCategory.isEmpty || value.isEmpty) {
      ToastMessage.showToast("Preencha todos os campos obrigatórios.");
      return;
    }

    widget.onSubmit(idUser as int, idCategory as int, value as double);
    ToastMessage.showToast("Orçamento cadastrado com sucesso.");
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
              CategoryListScreen(
                onCategorySelected: (category) {
                  setState(() {
                    _selectedCategory = category;
                  });
                },
              ),
            ),
            selectedOption: _selectedCategory,
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
