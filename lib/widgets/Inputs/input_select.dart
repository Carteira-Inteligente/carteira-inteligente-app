import 'package:flutter/material.dart';

import '../../constants/svgs.dart';
import '../Containers/inkwell_container.dart';

class InputSelect extends StatefulWidget {
  const InputSelect({
    super.key,
    required this.label,
    required this.controller,
    required this.onTap,
    required this.selectedOption,
  });

  final String label;
  final TextEditingController controller;
  final void Function() onTap;
  final String selectedOption;

  @override
  State<InputSelect> createState() => _InputSelectState();
}

class _InputSelectState extends State<InputSelect> {
  @override
  Widget build(BuildContext context) {
    return InkwellContainer(
      label: widget.label,
      text: widget.selectedOption == "" ? "Selecione" : widget.selectedOption,
      icon: sArrowDown,
      onTap: widget.onTap,
    );
  }
}
