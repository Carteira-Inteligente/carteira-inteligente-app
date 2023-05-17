import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../constants/svgs.dart';
import '../../constants/widgets.dart';
import '../Containers/input_container.dart';
import '../Containers/input_icon_container.dart';

class InputEmail extends StatelessWidget {
  const InputEmail({
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
        keyboardType: TextInputType.emailAddress,
        onSubmitted: (_) => onSubmit,
        decoration: InputDecoration(
          border: const OutlineInputBorder(
            borderRadius: wInputBorderRadius,
            borderSide: BorderSide(color: cBlack),
          ),
          hintStyle: Theme.of(context).textTheme.displaySmall,
          suffixIcon: const InputIconContainer(svgIcon: sMail),
        ),
      ),
    );
  }
}
