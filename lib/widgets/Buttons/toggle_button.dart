import 'package:carteira_inteligente/constants/constants.dart';
import 'package:carteira_inteligente/widgets/Labels/input_label.dart';
import 'package:flutter/material.dart';

class ToggleButton extends StatefulWidget {
  const ToggleButton(this.label, {super.key});

  final String label;
  @override
  State<ToggleButton> createState() => _ToggleButtonState();
}

class _ToggleButtonState extends State<ToggleButton> {
  bool _isOn = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: GestureDetector(
        onTap: () {
          setState(() {
            _isOn = !_isOn;
          });
        },
        child: Row(
          children: <Widget>[
            InputLabel(widget.label),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Container(
                width: 50,
                height: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: _isOn ? cGreenAccent.shade400 : cGrey.shade300,
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Align(
                        alignment: _isOn
                            ? Alignment.centerRight
                            : Alignment.centerLeft,
                        child: Container(
                          width: 22,
                          height: 22,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: cWhite,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
