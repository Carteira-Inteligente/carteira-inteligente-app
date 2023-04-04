import 'package:carteira_inteligente_app/constants/constants.dart';
import 'package:carteira_inteligente_app/widgets/Containers/input_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DropdownButtonInput extends StatefulWidget {
  const DropdownButtonInput(this.label, this.controller, this.onSubmit,
      {super.key});

  final String label;
  final TextEditingController controller;
  final void Function() onSubmit;

  @override
  State<DropdownButtonInput> createState() => _DropdownButtonInputState();
}

class _DropdownButtonInputState extends State<DropdownButtonInput> {
  String selectedItem = "Selecione";

  List<String> items = [
    "Selecione",
    "Não repete",
    "Semanal",
    "Mensal",
    "Trimestral",
    "Semestral",
    "Anual",
  ];

  @override
  Widget build(BuildContext context) {
    return InputContainer(
      widget.label,
      DropdownButtonFormField(
        decoration: const InputDecoration(
          border: OutlineInputBorder(
            borderRadius: wInputBorderRadius,
            borderSide: BorderSide(
              color: cBlack,
            ),
          ),
        ),
        value: selectedItem,
        onChanged: (newValue) {
          setState(() {
            selectedItem = newValue!;
          });
        },
        items: items.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        borderRadius: wInputBorderRadius,
        dropdownColor: cWhite,
        icon: SvgPicture.asset(sArrowDown),
      ),
    );
  }
}
