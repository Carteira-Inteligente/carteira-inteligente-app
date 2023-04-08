import 'package:carteira_inteligente_app/constants/constants.dart';
import 'package:carteira_inteligente_app/screens/Categories/categories_list_screen.dart';
import 'package:carteira_inteligente_app/screens/Recurrence/recurrence_list_screen.dart';
import 'package:carteira_inteligente_app/utils/show_modal.dart';
import 'package:carteira_inteligente_app/utils/toast_message.dart';
import 'package:carteira_inteligente_app/widgets/Buttons/primary_button.dart';
import 'package:carteira_inteligente_app/widgets/Buttons/toggle_button.dart';
import 'package:carteira_inteligente_app/widgets/Containers/form_container.dart';
import 'package:carteira_inteligente_app/widgets/Inputs/input_select.dart';
import 'package:carteira_inteligente_app/widgets/Inputs/input_date.dart';
import 'package:carteira_inteligente_app/widgets/Inputs/input_number.dart';
import 'package:carteira_inteligente_app/widgets/Inputs/input_text.dart';
import 'package:carteira_inteligente_app/widgets/Labels/title_label.dart';
import 'package:flutter/material.dart';

class EntryFormScreen extends StatefulWidget {
  const EntryFormScreen(this.onSubmit, {super.key});

  final void Function(
    int,
    int,
    String,
    String,
    double,
    DateTime,
    bool,
    DateTime,
  ) onSubmit;

  @override
  State<EntryFormScreen> createState() => _EntryFormScreenState();
}

class _EntryFormScreenState extends State<EntryFormScreen> {
  final _idUsercontroller = TextEditingController();
  final _idCategoryController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _periodController = TextEditingController();
  final _paidValueController = TextEditingController();
  DateTime _paidDateController = DateTime.now();
  final _padController = TextEditingController();
  DateTime _dueDateController = DateTime.now();

  _submitForm() {
    final idUser = _idUsercontroller.text;
    final idCategory = _idCategoryController.text;
    final description = _descriptionController.text;
    final period = _periodController.text;
    final paidValue = _paidValueController.text;
    final paid = _padController.text;

    if (idUser.isEmpty ||
        idCategory.isEmpty ||
        description.isEmpty ||
        period.isEmpty ||
        paidValue.isEmpty ||
        paid.isEmpty) {
      ToastMessage.showToast("Preencha todos os campos obrigatórios.");
      return;
    }

    widget.onSubmit(
      idUser as int,
      idCategory as int,
      description,
      period,
      paidValue as double,
      _paidDateController,
      paid as bool,
      _dueDateController,
    );
    ToastMessage.showToast("Lançamento cadastrado do sucesso.");
  }

  @override
  Widget build(BuildContext context) {
    return FormContainer(
      "Nova despesa",
      Column(
        children: <Widget>[
          const ToggleButton("Pagamento realizado"),
          InputSelect(
            "Categoria",
            _idCategoryController,
            // _submitForm,
            () => ShowModal.showModal(
              context,
              const CategoriesListScreen(),
            ),
          ),
          InputText(
            "Descrição",
            _descriptionController,
            _submitForm,
          ),
          InputSelect(
            "Recorrência",
            _periodController,
            () => ShowModal.showModal(
              context,
              const RecurrenceListScreen(),
            ),
          ),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.only(right: 4.0),
                  child: InputNumber(
                    "Valor",
                    _paidValueController,
                    _submitForm,
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.only(left: 4.0),
                  child: InputNumber(
                    "Valor pago",
                    _paidValueController,
                    _submitForm,
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.only(right: 4.0),
                  child: InputDate(
                    "Data de vencimento",
                    _paidDateController,
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.only(left: 4.0),
                  child: InputDate(
                    "Data de pagamento",
                    _paidDateController,
                  ),
                ),
              ),
            ],
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
