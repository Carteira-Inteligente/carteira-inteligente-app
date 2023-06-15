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
import '../Modals/category_modal.dart';
import '../Modals/payment_method_modal.dart';
import '../Modals/recurrence_modal.dart';

class EntryFormScreen extends StatefulWidget {
  const EntryFormScreen({
    super.key,
    required this.onSubmit,
  });

  final void Function(bool, String, int, int, int, double, DateTime) onSubmit;

  @override
  State<EntryFormScreen> createState() => _EntryFormScreenState();
}

class _EntryFormScreenState extends State<EntryFormScreen> {
  int _selectedCategoryId = 0;
  int _selectedRecurrenceId = 0;
  int _selectedPaymentTypeId = 0;
  String _selectedCategoryDescription = "";
  String _selectedRecurrenceDescription = "";
  String _selectedPaymentTypeDescription = "";

  final _padController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _idCategoryController = TextEditingController();
  final _recurrenceController = TextEditingController();
  final _paymentTypeController = TextEditingController();
  final _valueController = TextEditingController();
  DateTime _dueDateController = DateTime.now();

  _submitForm() {
    final paid = _padController.text;
    final description = _descriptionController.text;
    final idCategory = _selectedCategoryId;
    final idRecurrence = _selectedRecurrenceId;
    final idPaymentType = _selectedPaymentTypeId;
    final value = _valueController.text.replaceAll(",", ".");

    if (description.isEmpty ||
        idCategory.isNaN ||
        idRecurrence.isNaN ||
        idPaymentType.isNaN ||
        value.isEmpty) {
      ToastMessage.warningToast("Preencha todos os campos obrigatórios.");
      return;
    }

    widget.onSubmit(
      paid as bool,
      description,
      idCategory,
      idRecurrence,
      idPaymentType,
      double.parse(value),
      _dueDateController,
    );
    ToastMessage.successToast("Lançamento cadastrado com sucesso.");
  }

  @override
  Widget build(BuildContext context) {
    return FormContainer(
      title: "Novo lançamento",
      height: MediaQuery.of(context).size.height * 0.78,
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
              CategoryModal(
                onSelected: (category, categoryId) {
                  setState(() {
                    _selectedCategoryDescription = category;
                    _selectedCategoryId = categoryId;
                  });
                },
              ),
            ),
            selectedOption: _selectedCategoryDescription,
          ),
          InputSelect(
            label: "Recorrência",
            controller: _recurrenceController,
            onTap: () => ShowModal.showModal(
              context,
              RecurrenceModal(
                onSelected: (recurrence, recurrenceId) {
                  setState(() {
                    _selectedRecurrenceDescription = recurrence;
                    _selectedRecurrenceId = recurrenceId;
                  });
                },
              ),
            ),
            selectedOption: _selectedRecurrenceDescription,
          ),
          // Ajustar informações
          InputSelect(
            label: "Forma de pagamento",
            controller: _recurrenceController,
            onTap: () => ShowModal.showModal(
              context,
              PaymentMethodModal(
                onSelected: (paymentType, paymentTypeId) {
                  setState(() {
                    _selectedPaymentTypeDescription = paymentType;
                    _selectedPaymentTypeId = paymentTypeId;
                  });
                },
              ),
            ),
            selectedOption: _selectedPaymentTypeDescription,
          ),
          InputValue(
            label: "Valor",
            controller: _valueController,
            onSubmit: _submitForm,
          ),
          InputDate(
            label: "Data de vencimento",
            controller: _dueDateController,
          ),
        ],
      ),
    );
  }
}
