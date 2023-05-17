import 'package:carteira_inteligente/constants/widgets.dart';
import 'package:carteira_inteligente/screens/Category/category_list_screen.dart';
import 'package:carteira_inteligente/screens/PaymentType/payment_type_list_screen.dart';
import 'package:carteira_inteligente/screens/Recurrence/recurrence_list_screen.dart';
import 'package:carteira_inteligente/utils/show_modal.dart';
import 'package:carteira_inteligente/utils/toast_message.dart';
import 'package:carteira_inteligente/widgets/Buttons/primary_button.dart';
import 'package:carteira_inteligente/widgets/Buttons/toggle_button.dart';
import 'package:carteira_inteligente/widgets/Containers/form_container.dart';
import 'package:carteira_inteligente/widgets/Inputs/input_select.dart';
import 'package:carteira_inteligente/widgets/Inputs/input_date.dart';
import 'package:carteira_inteligente/widgets/Inputs/input_number.dart';
import 'package:carteira_inteligente/widgets/Inputs/input_text.dart';
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
  String _selectedCategory = "";
  String _selectedRecurrence = "";
  String _selectedPaymentType = "";

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
      "Novo lançamento",
      Column(
        children: <Widget>[
          const ToggleButton("Pagamento realizado"),
          InputText(
            "Descrição",
            _descriptionController,
            _submitForm,
          ),
          InputSelect(
            "Categoria",
            _idCategoryController,
            () => ShowModal.showModal(
              context,
              CategoryListScreen(
                (category) {
                  setState(() {
                    _selectedCategory = category;
                  });
                },
              ),
            ),
            _selectedCategory,
          ),
          InputSelect(
            "Recorrência",
            _periodController,
            () => ShowModal.showModal(
              context,
              RecurrenceListScreen(
                (recurrence) {
                  setState(() {
                    _selectedRecurrence = recurrence;
                  });
                },
              ),
            ),
            _selectedRecurrence,
          ),
          // Ajustar informações
          InputSelect(
            "Forma de pagamento",
            _periodController,
            () => ShowModal.showModal(
              context,
              PaymentTypeListScreen(
                (paymentType) {
                  setState(() {
                    _selectedPaymentType = paymentType;
                  });
                },
              ),
            ),
            _selectedPaymentType,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 4.0),
            child: InputNumber(
              "Valor",
              _paidValueController,
              _submitForm,
            ),
          ),
          Row(
            children: <Widget>[
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
