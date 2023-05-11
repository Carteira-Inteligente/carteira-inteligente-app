import 'package:carteira_inteligente/constants/constants.dart';
import 'package:carteira_inteligente/utils/toast_message.dart';
import 'package:carteira_inteligente/widgets/Buttons/primary_button.dart';
import 'package:carteira_inteligente/widgets/Containers/form_container.dart';
import 'package:carteira_inteligente/widgets/Inputs/input_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CategoriesFormScreen extends StatefulWidget {
  const CategoriesFormScreen(this.onSubmit, {super.key});

  final void Function(
    String,
    SvgPicture,
  ) onSubmit;

  @override
  State<CategoriesFormScreen> createState() => _CategoriesFormScreenState();
}

class _CategoriesFormScreenState extends State<CategoriesFormScreen> {
  final _descriptionController = TextEditingController();

  _submitForm() {
    final description = _descriptionController.text;
    final icon = SvgPicture.asset(sOther);

    if (description.isEmpty) {
      ToastMessage.showToast("Preencha todos os campos obrigatórios.");
      return;
    }

    widget.onSubmit(description, icon as SvgPicture);
    ToastMessage.showToast("Lançamento cadastrado do sucesso.");
  }

  @override
  Widget build(BuildContext context) {
    return FormContainer(
      "Nova categoria",
      Column(
        children: <Widget>[
          InputText(
            "Descrição",
            _descriptionController,
            _submitForm,
          ),
        ],
      ),
      PrimaryButton(
        wLargeButtonMinimunSize,
        "Salvar",
        _submitForm,
      ),
    );
  }
}
