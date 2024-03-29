import 'package:carteira_inteligente/widgets/Containers/header_modal_container.dart';
import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../utils/messages_utils.dart';
import '../../utils/toast_message.dart';
import '../../widgets/Buttons/primary_buttons.dart';
import '../../widgets/Inputs/input_value.dart';
import '../../widgets/Inputs/input_text.dart';
import '../../widgets/Labels/title_labels.dart';

class FastEntryScreen extends StatefulWidget {
  const FastEntryScreen({
    super.key,
    required this.onSubmit,
  });

  final void Function(
    String,
    double,
  ) onSubmit;

  @override
  State<FastEntryScreen> createState() => _FastEntryScreenState();
}

class _FastEntryScreenState extends State<FastEntryScreen> {
  final _descriptionController = TextEditingController();
  final _paidValueController = TextEditingController();

  _submitForm() {
    final description = _descriptionController.text;
    final paidValue = _paidValueController.text.replaceAll(",", ".");

    if (description.isEmpty || paidValue.isEmpty) {
      ToastMessage.warningToast(MessagesUtils.notEmptyFields());
      return;
    }

    widget.onSubmit(description, double.parse(paidValue));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const HeaderModalContainer(label: "Novo lançamento rápido"),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.25,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            child: Column(
              children: <Widget>[
                InputText(
                  label: "Descrição",
                  controller: _descriptionController,
                  onSubmit: _submitForm,
                ),
                InputValue(
                  label: "Valor",
                  controller: _paidValueController,
                  onSubmit: _submitForm,
                ),
              ],
            ),
          ),
        ),
        Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text(
                "Após salvar, você poderá editar e incluir outras "
                "informações neste registro. Basta acessar o item "
                "\"Lançamentos\" no menu.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: "OpenSans",
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  color: cGrey.shade600,
                ),
              ),
            ),
            PrimaryButton(
              textButton: "Salvar",
              onPressed: _submitForm,
            ),
          ],
        ),
      ],
    );
  }
}
