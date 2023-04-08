import 'package:carteira_inteligente_app/constants/constants.dart';
import 'package:carteira_inteligente_app/widgets/Containers/inkwell_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

class InputDate extends StatefulWidget {
  const InputDate(this.label, this.controller, {super.key});

  final String label;
  final DateTime controller;

  @override
  State<InputDate> createState() => _InputDateState();
}

class _InputDateState extends State<InputDate> {
  DateTime? _selectedDate;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkwellContainer(
      widget.label,
      _selectedDate == null
          ? ""
          : DateFormat("dd/MM/y").format(widget.controller),
      sCalendar,
      () {
        _selectDate(context);
      },
    );
  }
}
