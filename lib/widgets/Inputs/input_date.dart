import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../constants/svgs.dart';
import '../Containers/input_containers.dart';

class InputDate extends StatefulWidget {
  const InputDate({
    super.key,
    required this.label,
    required this.controller,
  });

  final String label;
  final TextEditingController controller;

  @override
  State<InputDate> createState() => _InputDateState();
}

class _InputDateState extends State<InputDate> {
  DateTime? _selectedDate;

  Future<void> _selectDatePicker(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        widget.controller.text = DateFormat("dd/MM/yyy").format(picked);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkwellContainer(
      label: widget.label,
      text: _selectedDate == null ? "" : widget.controller.text,
      icon: sCalendar,
      onTap: () => _selectDatePicker(context),
    );
  }
}
