import 'package:carteira_inteligente_app/constants/constants.dart';
import 'package:carteira_inteligente_app/utils/toast_message.dart';
import 'package:carteira_inteligente_app/widgets/Buttons/primary_button.dart';
import 'package:carteira_inteligente_app/widgets/Buttons/toggle_button.dart';
import 'package:carteira_inteligente_app/widgets/Containers/form_container.dart';
import 'package:carteira_inteligente_app/widgets/Inputs/dropdown_button_input.dart';
import 'package:carteira_inteligente_app/widgets/Inputs/input_date.dart';
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
      ToastMessage.showWarning("Preencha todos os campos obrigatórios.");
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
    ToastMessage.showSuccess("Lançamento cadastrado do sucesso.");
  }

  @override
  Widget build(BuildContext context) {
    return FormContainer(
      Column(
        children: <Widget>[
          Row(
            children: const <Widget>[
              TitleLabel(
                "Novo lançamento",
              ),
            ],
          ),
          const ToggleButton("Pagamento realizado"),
          DropdownButtonInput(
            "Categoria",
            _idCategoryController,
            _submitForm,
          ),
          InputText(
            "Descrição",
            _descriptionController,
            TextInputType.text,
            _submitForm,
          ),
          DropdownButtonInput(
            "Recorrência",
            _periodController,
            _submitForm,
          ),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.only(right: 4.0),
                  child: InputText(
                    "Valor",
                    _paidValueController,
                    const TextInputType.numberWithOptions(decimal: true),
                    _submitForm,
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.only(left: 4.0),
                  child: InputText(
                    "Valor pago",
                    _paidValueController,
                    const TextInputType.numberWithOptions(decimal: true),
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
