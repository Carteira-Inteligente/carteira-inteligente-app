import 'package:carteira_inteligente/constants/constants.dart';
import 'package:carteira_inteligente/screens/Categories/categories_list_screen.dart';
import 'package:carteira_inteligente/utils/show_modal.dart';
import 'package:carteira_inteligente/utils/toast_message.dart';
import 'package:carteira_inteligente/widgets/Buttons/primary_button.dart';
import 'package:carteira_inteligente/widgets/Containers/form_container.dart';
import 'package:carteira_inteligente/widgets/Inputs/input_select.dart';
import 'package:carteira_inteligente/widgets/Inputs/input_number.dart';
import 'package:flutter/material.dart';

class BudgetFormScreen extends StatefulWidget {
  const BudgetFormScreen(this.onSubmit, {super.key});

  final void Function(
    int,
    int,
    double,
  ) onSubmit;

  @override
  State<BudgetFormScreen> createState() => _BudgetFormScreenState();
}

class _BudgetFormScreenState extends State<BudgetFormScreen> {
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
    ToastMessage.showToast("Lançamento cadastrado do sucesso.");
  }

  @override
  Widget build(BuildContext context) {
    return FormContainer(
      "Novo orçamento",
      Column(
        children: <Widget>[
          InputSelect(
            "Categoria",
            _idCategoryController,
            // _submitForm,
            () => ShowModal.showModal(
              context,
              const CategoriesListScreen(),
            ),
          ),
          InputNumber(
            "Valor limite",
            _valueController,
            _submitForm,
          ),
        ],
      ),
      PrimaryButton(
        wLargeButtonMinimunSize,
        "Salvar",
        _submitForm,
      ),
    );
  }
}
