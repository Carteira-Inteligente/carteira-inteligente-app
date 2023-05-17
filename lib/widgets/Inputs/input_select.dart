import 'package:carteira_inteligente/constants/svgs.dart';
import 'package:carteira_inteligente/widgets/Containers/inkwell_container.dart';
import 'package:flutter/material.dart';

class InputSelect extends StatefulWidget {
  const InputSelect(
      this.label, this.controller, this.onTap, this.selectedCategory,
      {super.key});

  final String label;
  final TextEditingController controller;
  final void Function() onTap;
  final String selectedCategory;

  @override
  State<InputSelect> createState() => _InputSelectState();
}

class _InputSelectState extends State<InputSelect> {
  @override
  Widget build(BuildContext context) {
    return InkwellContainer(
      widget.label,
      widget.selectedCategory == "" ? "Selecione" : widget.selectedCategory,
      sArrowDown,
      widget.onTap,
    );
  }
}
