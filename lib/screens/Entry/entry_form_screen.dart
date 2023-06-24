import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
  String _selectedCategoryDescription = "";
  String _selectedPeriodId = "";
  String _selectedPeriodDescription = "";
  int _selectedPaymentTypeId = 0;
  String _selectedPaymentTypeDescription = "";

  bool _showPaidDate = false;
  bool _showOnlyDueDate = true;

  bool _isPaid = false;
  final _descriptionController = TextEditingController();
  final _idCategoryController = TextEditingController();
  final _periodController = TextEditingController();
  final _paymentTypeController = TextEditingController();
  final _valueController = TextEditingController();
  final _dueDateController = TextEditingController();
  final _paidDateController = TextEditingController();

  _submitForm() {
    final paid = _isPaid;
    final description = _descriptionController.text;
    final idCategory = _selectedCategoryId;
    final period = _selectedPeriodId;
    final idPaymentType = _selectedPaymentTypeId;
    final value = _valueController.text.replaceAll(",", ".");
    DateTime? dueDate;
    DateTime? paidDate;

    if (_dueDateController.text.isNotEmpty) {
      dueDate = DateFormat("dd/MM/yyy").parse(_dueDateController.text);
    }

    if (_paidDateController.text.isNotEmpty) {
      paidDate = DateFormat("dd/MM/yyy").parse(_paidDateController.text);
    }

    widget.onSubmit(
      paid,
      description,
      idCategory,
      period,
      idPaymentType,
      double.parse(value),
      dueDate ?? DateTime.now(),
      paidDate ?? DateTime.now(),
    );
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
          ToggleButton(
            label: "Pagamento realizado",
            isPaid: _isPaid,
            onChanged: (value) {
              setState(() {
                _isPaid = value;
                if (_isPaid) {
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
            controller: _paymentTypeController,
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
              controller: _dueDateController,
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
                      controller: _dueDateController,
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
          )
        ],
      ),
    );
  }
}
