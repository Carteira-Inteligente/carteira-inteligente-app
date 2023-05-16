import 'package:carteira_inteligente/constants/constants.dart';
import 'package:carteira_inteligente/widgets/Containers/input_container.dart';
import 'package:carteira_inteligente/widgets/Containers/input_icon_container.dart';
import 'package:flutter/material.dart';

class InputNumber extends StatelessWidget {
  const InputNumber(this.label, this.controller, this.onSubmit, {super.key});

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
        keyboardType: const TextInputType.numberWithOptions(decimal: true),
        onSubmitted: (_) => onSubmit,
        decoration: InputDecoration(
          border: const OutlineInputBorder(
            borderRadius: wInputBorderRadius,
            borderSide: BorderSide(color: cBlack),
          ),
          prefixText: "R\$ ",
          hintStyle: Theme.of(context).textTheme.displaySmall,
          suffixIcon: const InputIconContainer(sMoney),
        ),
      ),
    );
  }
}
