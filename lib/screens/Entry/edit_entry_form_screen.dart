import 'package:flutter/material.dart';

import '../../utils/show_modal.dart';
import '../../utils/toast_message.dart';
import '../../widgets/Buttons/primary_buttons.dart';
import '../../widgets/Buttons/toggle_button.dart';
import '../../widgets/Containers/form_containers.dart';
import '../../widgets/Inputs/input_date.dart';
import '../../widgets/Inputs/input_value.dart';
import '../../widgets/Inputs/input_select.dart';
import '../../widgets/Inputs/input_text.dart';
import '../Category/category_list_screen.dart';
import '../PaymentType/payment_type_list_screen.dart';
import '../Recurrence/recurrence_list_screen.dart';

class EditEntryFormScreen extends StatefulWidget {
  const EditEntryFormScreen({
    super.key,
    required this.onSubmit,
  });

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
  State<EditEntryFormScreen> createState() => _EditEntryFormScreenState();
}

class _EditEntryFormScreenState extends State<EditEntryFormScreen> {
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
    ToastMessage.showToast("Lançamento alterado com sucesso.");
  }

  @override
  Widget build(BuildContext context) {
    return FormContainer(
      title: "Edição de lançamento",
      height: MediaQuery.of(context).size.height * 0.76,
      bottonButton: PrimaryButton(
        textButton: "Salvar",
        onPressed: _submitForm,
      ),
      child: Column(
        children: <Widget>[
          const ToggleButton(label: "Pagamento realizado"),
          InputText(
            label: "Descrição",
            controller: _descriptionController,
            onSubmit: _submitForm,
          ),
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
          InputSelect(
            label: "Recorrência",
            controller: _periodController,
            onTap: () => ShowModal.showModal(
              context,
              RecurrenceListScreen(
                onRecurrenceSelected: (recurrence) {
                  setState(() {
                    _selectedRecurrence = recurrence;
                  });
                },
              ),
            ),
            selectedOption: _selectedRecurrence,
          ),
          // Ajustar informações
          InputSelect(
            label: "Forma de pagamento",
            controller: _periodController,
            onTap: () => ShowModal.showModal(
              context,
              PaymentTypeListScreen(
                onPaymentTypeSelected: (paymentType) {
                  setState(() {
                    _selectedPaymentType = paymentType;
                  });
                },
              ),
            ),
            selectedOption: _selectedPaymentType,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 4.0),
            child: InputValue(
              label: "Valor",
              controller: _paidValueController,
              onSubmit: _submitForm,
            ),
          ),
          Row(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.only(right: 4.0),
                  child: InputDate(
                    label: "Data de vencimento",
                    controller: _paidDateController,
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.only(left: 4.0),
                  child: InputDate(
                    label: "Data de pagamento",
                    controller: _paidDateController,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
