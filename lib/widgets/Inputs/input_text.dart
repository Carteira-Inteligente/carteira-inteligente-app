import 'package:carteira_inteligente_app/constants/constants.dart';
import 'package:carteira_inteligente_app/widgets/Containers/input_container.dart';
import 'package:flutter/material.dart';

class InputText extends StatelessWidget {
  const InputText(this.label, this.controller, this.keyboardType, this.onSubmit,
      {super.key});

  final String label;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final void Function() onSubmit;

  @override
  Widget build(BuildContext context) {
    return InputContainer(
      label,
      TextField(
        controller: controller,
        keyboardType: keyboardType,
        onSubmitted: (_) => onSubmit,
        decoration: const InputDecoration(
          border: OutlineInputBorder(
            borderRadius: wInputBorderRadius,
            borderSide: BorderSide(
              color: cBlack,
            ),
          ),
        ),
      ),
    );
  }
}
