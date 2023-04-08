import 'package:carteira_inteligente_app/constants/constants.dart';
import 'package:carteira_inteligente_app/widgets/Containers/input_container.dart';
import 'package:carteira_inteligente_app/widgets/Containers/input_icon_container.dart';
import 'package:flutter/material.dart';

class InputText extends StatelessWidget {
  const InputText(this.label, this.controller, this.onSubmit, {super.key});

  final String label;
  final TextEditingController controller;
  final void Function() onSubmit;

  @override
  Widget build(BuildContext context) {
    return InputContainer(
      label,
      TextField(
        style: Theme.of(context).textTheme.displaySmall,
        controller: controller,
        keyboardType: TextInputType.text,
        onSubmitted: (_) => onSubmit,
        decoration: const InputDecoration(
          border: OutlineInputBorder(
            borderRadius: wInputBorderRadius,
            borderSide: BorderSide(
              color: cBlack,
            ),
          ),
          suffixIcon: InputIconContainer(sText),
        ),
      ),
    );
  }
}
