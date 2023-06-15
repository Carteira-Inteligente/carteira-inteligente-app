import 'package:flutter/material.dart';

import '../../utils/show_modal.dart';
import '../../utils/toast_message.dart';
import '../../widgets/Buttons/primary_buttons.dart';
import '../../widgets/Containers/form_containers.dart';
import '../../widgets/Inputs/input_select.dart';
import '../../widgets/Inputs/input_text.dart';
import '../Modals/payment_type_modal.dart';

class PaymentTypeFormScreen extends StatefulWidget {
  const PaymentTypeFormScreen({
    super.key,
    required this.onSubmit,
  });

  final void Function(
    String,
    String,
  ) onSubmit;

  @override
  State<PaymentTypeFormScreen> createState() => _PaymentTypeFormScreenState();
}

class _PaymentTypeFormScreenState extends State<PaymentTypeFormScreen> {
  String _selectedDescription = "";
  String _selectedType = "";

  final _paymentTypeController = TextEditingController();
  final _descriptionController = TextEditingController();

  @override
  void dispose() {
    _descriptionController.dispose();
    super.dispose();
  }

  _submitForm() async {
    final type = _selectedType;
    final description = _descriptionController.text;

    if (type.isEmpty || description.isEmpty) {
      ToastMessage.warningToast("Preencha todos os campos obrigatórios.");
      return;
    }

    widget.onSubmit(description, type);
  }

  @override
  Widget build(BuildContext context) {
    return FormContainer(
      title: "Nova forma de pagamento",
      bottonButton: PrimaryButton(
        textButton: "Salvar",
        onPressed: _submitForm,
      ),
      child: Column(
        children: <Widget>[
          InputSelect(
            label: "Tipo de pagamento",
            controller: _paymentTypeController,
            onTap: () => ShowModal.showModal(
              context,
              PaymentTypeModal(
                onSelected: (description, type) {
                  setState(() {
                    _selectedDescription = description;
                    _selectedType = type;
                  });
                },
              ),
            ),
            selectedOption: _selectedDescription,
          ),
          InputText(
            label: "Descrição",
            controller: _descriptionController,
            onSubmit: _submitForm,
          ),
        ],
      ),
    );
  }
}
