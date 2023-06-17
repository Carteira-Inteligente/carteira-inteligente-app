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
import '../Modals/period_modal.dart';

class EntryFormScreen extends StatefulWidget {
  const EntryFormScreen({
    super.key,
    required this.onSubmit,
  });

  final void Function(
    bool,
    String,
    int,
    String,
    int,
    double,
    DateTime,
    DateTime,
  ) onSubmit;

  @override
  State<EntryFormScreen> createState() => _EntryFormScreenState();
}

class _EntryFormScreenState extends State<EntryFormScreen> {
  int _selectedCategoryId = 0;
  String _selectedPeriodId = "";
  int _selectedPaymentTypeId = 0;
  String _selectedCategoryDescription = "";
  String _selectedPeriodDescription = "";
  String _selectedPaymentTypeDescription = "";

  final _paidController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _idCategoryController = TextEditingController();
  final _periodController = TextEditingController();
  final _paymentTypeController = TextEditingController();
  final _valueController = TextEditingController();
  DateTime _dueDateController = DateTime.now();
  DateTime _paidDateController = DateTime.now();

  _submitForm() {
    final paid = _paidController.text.isNotEmpty;
    final description = _descriptionController.text;
    final idCategory = _selectedCategoryId;
    final period = _selectedPeriodId;
    final idPaymentType = _selectedPaymentTypeId;
    final value = _valueController.text.replaceAll(",", ".");

    if (description.isEmpty ||
        idCategory.isNaN ||
        period.isEmpty ||
        idPaymentType.isNaN ||
        value.isEmpty) {
      ToastMessage.warningToast("Preencha todos os campos obrigatórios.");
      return;
    }

    widget.onSubmit(
      paid,
      description,
      idCategory,
      period,
      idPaymentType,
      double.parse(value),
      _dueDateController,
      _paidDateController,
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
            controller: _periodController,
            onTap: () => ShowModal.showModal(
              context,
              PeriodModal(
                onSelected: (period, periodId) {
                  setState(() {
                    _selectedPeriodDescription = period;
                    _selectedPeriodId = periodId;
                  });
                },
              ),
            ),
            selectedOption: _selectedPeriodDescription,
          ),
          // Ajustar informações
          InputSelect(
            label: "Forma de pagamento",
            controller: _periodController,
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
