import 'package:carteira_inteligente/constants/constants.dart';
import 'package:carteira_inteligente/utils/toast_message.dart';
import 'package:carteira_inteligente/widgets/Buttons/primary_button.dart';
import 'package:carteira_inteligente/widgets/Containers/modal_form_container.dart';
import 'package:carteira_inteligente/widgets/Inputs/input_number.dart';
import 'package:carteira_inteligente/widgets/Inputs/input_text.dart';
import 'package:flutter/material.dart';

class FastEntryScreen extends StatefulWidget {
  const FastEntryScreen(this.onSubmit, {super.key});

  final void Function(
    int,
    String,
    double,
  ) onSubmit;

  @override
  State<FastEntryScreen> createState() => _FastEntryScreenState();
}

class _FastEntryScreenState extends State<FastEntryScreen> {
  final _idUsercontroller = TextEditingController();
  final _descriptionController = TextEditingController();
  final _paidValueController = TextEditingController();

  _submitForm() {
    final idUser = _idUsercontroller.text;
    final description = _descriptionController.text;
    final paidValue = _paidValueController.text;

    if (idUser.isEmpty || description.isEmpty || paidValue.isEmpty) {
      ToastMessage.showToast("Preencha todos os campos obrigatórios.");
      return;
    }

    widget.onSubmit(
      idUser as int,
      description,
      paidValue as double,
    );
    ToastMessage.showToast("Lançamento cadastrado do sucesso.");
  }

  @override
  Widget build(BuildContext context) {
    return ModalFormContainer(
      "Novo lançamento rápido",
      Column(
        children: <Widget>[
          InputText(
            "Descrição",
            _descriptionController,
            _submitForm,
          ),
          InputNumber(
            "Valor",
            _paidValueController,
            _submitForm,
          ),
        ],
      ),
      "Após salvar, você poderá editar e incluir outras informações neste "
          "registro. Basta acessar o item \"Lançamentos\" no menu.",
      PrimaryButton(
        wLargeButtonMinimunSize,
        "Salvar",
        _submitForm,
      ),
    );
  }
}
