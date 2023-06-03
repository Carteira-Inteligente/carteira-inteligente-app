import 'dart:io';

import 'package:flutter/cupertino.dart';
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
  final DateTime controller;

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
      });
    }
  }

  Future<void> _selectCupertinoDatePicker(BuildContext context) async {
    await showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          height: 300.0,
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  CupertinoButton(
                    onPressed: () {
                      setState(() {
                        _selectedDate = null;
                      });
                      Navigator.of(context).pop();
                    },
                    child: const Text('Cancelar'),
                  ),
                  CupertinoButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('OK'),
                  ),
                ],
              ),
              Expanded(
                child: CupertinoDatePicker(
                  mode: CupertinoDatePickerMode.date,
                  initialDateTime: _selectedDate ?? DateTime.now(),
                  onDateTimeChanged: (DateTime newDateTime) {
                    setState(() {
                      _selectedDate = newDateTime;
                    });
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkwellContainer(
      label: widget.label,
      text: _selectedDate == null
          ? DateFormat("dd/MM/y").format(DateTime.now())
          : DateFormat("dd/MM/y").format(widget.controller),
      icon: sCalendar,
      onTap: () => Platform.isIOS
          ? _selectCupertinoDatePicker(context)
          : _selectDatePicker(context),
    );
  }
}
