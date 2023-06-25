import 'package:flutter/material.dart';

import '../../widgets/Buttons/primary_buttons.dart';
import '../../widgets/Inputs/input_value.dart';
import '../../widgets/Inputs/input_text.dart';
import '../../widgets/Labels/modal_title_label.dart';

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

    widget.onSubmit(description, double.parse(paidValue));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const ModalTitleLabel(label: "Novo lançamento rápido"),
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
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.0),
              child: ModalTitleLabel(
                label: "Após salvar, você poderá editar e incluir outras "
                    "informações neste registro. Basta acessar o item "
                    "\"Lançamentos\" no menu.",
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
