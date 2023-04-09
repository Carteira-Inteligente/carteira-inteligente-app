import 'package:carteira_inteligente/constants/constants.dart';
import 'package:carteira_inteligente/widgets/Containers/input_container.dart';
import 'package:carteira_inteligente/widgets/Containers/input_icon_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class InputEmail extends StatelessWidget {
  const InputEmail(this.label, this.controller, this.onSubmit, {super.key});

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
        keyboardType: TextInputType.emailAddress,
        onSubmitted: (_) => onSubmit,
        decoration: InputDecoration(
          border: const OutlineInputBorder(
            borderRadius: wInputBorderRadius,
            borderSide: BorderSide(
              color: cBlack,
            ),
          ),
          hintStyle: Theme.of(context).textTheme.displaySmall,
          suffixIcon: const InputIconContainer(sMail),
        ),
      ),
    );
  }
}
