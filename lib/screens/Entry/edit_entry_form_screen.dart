import 'package:flutter/material.dart';

import '../../models/category.dart';
import '../../models/entry.dart';
import '../../models/payment_type.dart';
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

class EditEntryFormScreen extends StatefulWidget {
  const EditEntryFormScreen({
    super.key,
    required this.entry,
    required this.onSubmit,
  });

  final Entry entry;
  final void Function(
    Entry,
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
  State<EditEntryFormScreen> createState() => _EditEntryFormScreenState();
}

class _EditEntryFormScreenState extends State<EditEntryFormScreen> {
  late bool _selectedPaid;
  late String _selectedDescription;
  late Category _selectedCategory;
  late String _selectedPeriod;
  late PaymentType _selectedPaymentType;
  late double _selectedValue;
  late DateTime _selectedDueDate;
  late DateTime _selectedPaidDate;
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
  final _idPaymentTypeController = TextEditingController();
  final _valueController = TextEditingController();
  DateTime _dueDateController = DateTime.now();
  DateTime _paidDateController = DateTime.now();

  @override
  void initState() {
    super.initState();
    _selectedPaid = widget.entry.paid;
    _selectedDescription = widget.entry.description;
    _selectedCategory = widget.entry.category;
    _selectedPeriod = widget.entry.period;
    _selectedPaymentType = widget.entry.paymentType;
    _selectedValue = widget.entry.paidValue;
    _valueController.text = _selectedValue.toString().replaceAll(".", ",");
    _selectedDueDate = widget.entry.dueDate;
    _selectedPaidDate = widget.entry.paidDate;
  }

  @override
  void dispose() {
    _paidController.dispose();
    _descriptionController.dispose();
    _idCategoryController.dispose();
    _periodController.dispose();
    _idPaymentTypeController.dispose();
    _valueController.dispose();
    super.dispose();
  }

  _submitForm() {
    final paid = _selectedPaid;
    final description = _selectedDescription;
    final idCategory = _selectedCategory;
    final period = _selectedPeriod;
    final idPaymentType = _selectedPaymentType;
    final value = _valueController.text.replaceAll(",", ".");
    final dueDate = _selectedDueDate;
    final paidDate = _selectedPaidDate;

    if (description.isEmpty ||
        idCategory == null ||
        period.isEmpty ||
        idPaymentType == null ||
        value.isEmpty ||
        dueDate == null ||
        paidDate == null) {
      ToastMessage.warningToast("Preencha todos os campos obrigatórios.");
      return;
    }

    widget.onSubmit(
      widget.entry,
      paid,
      description,
      _selectedCategoryId,
      _selectedPeriodId,
      _selectedPaymentTypeId,
      double.parse(value),
      _dueDateController,
      _dueDateController,
    );
    ToastMessage.successToast("Lançamento cadastrado com sucesso.");
  }

  @override
  Widget build(BuildContext context) {
    return FormContainer(
      title: "Edição de lançamento",
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
            controller: _idPaymentTypeController,
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
          Padding(
            padding: const EdgeInsets.only(right: 4.0),
            child: InputValue(
              label: "Valor",
              controller: _valueController,
              onSubmit: _submitForm,
            ),
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
