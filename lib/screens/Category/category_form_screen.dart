import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../constants/svgs.dart';
import '../../utils/toast_message.dart';
import '../../widgets/Buttons/primary_button.dart';
import '../../widgets/Containers/form_container.dart';
import '../../widgets/Inputs/input_text.dart';

class CategoryFormScreen extends StatefulWidget {
  const CategoryFormScreen(this.onSubmit, {super.key});

  final void Function(
    String,
    SvgPicture,
  ) onSubmit;

  @override
  State<CategoryFormScreen> createState() => _CategoryFormScreenState();
}

class _CategoryFormScreenState extends State<CategoryFormScreen> {
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
        "Salvar",
        _submitForm,
      ),
    );
  }
}
