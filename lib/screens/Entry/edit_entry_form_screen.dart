import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../data/period_data.dart';
import '../../models/entry.dart';
import '../../utils/show_modal.dart';
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
  late bool _selectedPaid;
  late TextEditingController _descriptionController;
  late int _selectedCategoryId = 0;
  late String _selectedCategoryDescription = "";
  late String _selectedPeriodId = "";
  late TextEditingController _periodController;
  late int _selectedPaymentTypeId = 0;
  late String _selectedPaymentTypeDescription = "";
  late double _selectedValue;
  late DateTime _selectedDueDate;
  late DateTime _selectedPaidDate;
  bool _showPaidDate = false;
  bool _showOnlyDueDate = true;

  final _idCategoryController = TextEditingController();
  final _idPaymentTypeController = TextEditingController();
  final _valueController = TextEditingController();
  final _dueDateController = TextEditingController();
  final _paidDateController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _selectedPaid = widget.entry.paid;
    _descriptionController =
        TextEditingController(text: widget.entry.description);
    _selectedCategoryId = widget.entry.category.id;
    _selectedCategoryDescription = widget.entry.category.description;
    _selectedPeriodId = buildPeriodId(widget.entry.period);
    _periodController = TextEditingController(
        text: buildPeriodDescription(widget.entry.period));
    _selectedPaymentTypeId = widget.entry.paymentType.id;
    _selectedPaymentTypeDescription = widget.entry.paymentType.description;
    _selectedValue = widget.entry.paidValue;
    _valueController.text =
        _selectedValue.toStringAsFixed(2).replaceAll(".", ",");
    _selectedDueDate = widget.entry.dueDate;
    _selectedPaidDate = widget.entry.paidDate;

    if (_selectedPaid) {
      _showPaidDate = true;
      _showOnlyDueDate = false;
    }
  }

  @override
  void dispose() {
    _descriptionController.dispose();
    _idCategoryController.dispose();
    _periodController.dispose();
    _idPaymentTypeController.dispose();
    _valueController.dispose();
    _dueDateController.dispose();
    _paidDateController.dispose();
    super.dispose();
  }

  void _updateDueDate(DateTime dueDate) {
    setState(() {
      _selectedDueDate = dueDate;
    });
  }

  void _updatePaidDate(DateTime paidDate) {
    setState(() {
      _selectedPaidDate = paidDate;
    });
  }

  _submitForm() {
    final paid = _selectedPaid;
    final description = _descriptionController.text;
    final value = _valueController.text.replaceAll(",", ".");
    final dueDate = _selectedDueDate;
    final paidDate = _selectedPaidDate;

    widget.onSubmit(
      widget.entry,
      _selectedCategoryId,
      _selectedPaymentTypeId,
      description,
      _selectedPeriodId,
      double.parse(value),
      dueDate,
      paid,
      paidDate,
    );
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
          ToggleButton(
            label: "Pagamento realizado",
            isPaid: _selectedPaid,
            onChanged: (value) {
              setState(() {
                _selectedPaid = value;
                if (_selectedPaid) {
                  _showOnlyDueDate = false;
                  _showPaidDate = true;
                } else {
                  _showOnlyDueDate = true;
                  _showPaidDate = false;
                }
              });
            },
          ),
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
                    _periodController.text = period;
                    _selectedPeriodId = periodId;
                  });
                },
              ),
            ),
            selectedOption: _periodController.text,
          ),
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
          InputValue(
            label: "Valor",
            controller: _valueController,
            onSubmit: _submitForm,
          ),
          Visibility(
            visible: _showOnlyDueDate,
            child: InputDate(
              label: "Data de vencimento",
              controller: TextEditingController(
                text: DateFormat("dd/MM/yyy").format(_selectedDueDate),
              ),
              selectedDate: _selectedDueDate,
              onDateSelected: _updateDueDate,
            ),
          ),
          Visibility(
            visible: _showPaidDate,
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 4.0),
                    child: InputDate(
                      label: "Data de vencimento",
                      controller: TextEditingController(
                        text: DateFormat("dd/MM/yyy").format(_selectedDueDate),
                      ),
                      selectedDate: _selectedDueDate,
                      onDateSelected: _updateDueDate,
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 4.0),
                    child: InputDate(
                      label: "Data de pagamento",
                      controller: TextEditingController(
                        text: DateFormat("dd/MM/yyy").format(_selectedPaidDate),
                      ),
                      selectedDate: _selectedPaidDate,
                      onDateSelected: _updatePaidDate,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
