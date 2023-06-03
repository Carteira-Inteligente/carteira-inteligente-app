import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../constants/svgs.dart';
import '../../constants/widgets.dart';
import '../Containers/input_containers.dart';

class InputText extends StatelessWidget {
  const InputText({
    super.key,
    required this.label,
    required this.controller,
    required this.onSubmit,
  });

  final String label;
  final TextEditingController controller;
  final void Function() onSubmit;

  @override
  Widget build(BuildContext context) {
    return InputContainer(
      label: label,
      child: TextField(
        style: Theme.of(context).textTheme.displaySmall,
        controller: controller,
        keyboardType: TextInputType.text,
        onSubmitted: (_) => onSubmit,
        decoration: const InputDecoration(
          border: OutlineInputBorder(
            borderRadius: wInputBorderRadius,
            borderSide: BorderSide(color: cBlack),
          ),
          suffixIcon: InputIconContainer(svgIcon: sText),
        ),
      ),
    );
  }
}
