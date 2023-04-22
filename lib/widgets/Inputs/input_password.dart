import 'package:carteira_inteligente/constants/constants.dart';
import 'package:carteira_inteligente/widgets/Containers/input_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class InputPassword extends StatefulWidget {
  const InputPassword(this.label, this.controller, this.onSubmit, {super.key});

  final String label;
  final TextEditingController controller;
  final void Function() onSubmit;

  @override
  State<InputPassword> createState() => _InputPasswordState();
}

class _InputPasswordState extends State<InputPassword> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return InputContainer(
      widget.label,
      TextField(
        style: Theme.of(context).textTheme.displaySmall,
        obscureText: _obscureText,
        controller: widget.controller,
        onSubmitted: (_) => widget.onSubmit,
        decoration: InputDecoration(
          border: const OutlineInputBorder(
            borderRadius: wInputBorderRadius,
            borderSide: BorderSide(
              color: cBlack,
            ),
          ),
          suffixIcon: GestureDetector(
            onTap: () {
              setState(() {
                _obscureText = !_obscureText;
              });
            },
            child: Transform.scale(
              scale: 0.5,
              child: _obscureText
                  ? SvgPicture.asset(
                      sHidePassword,
                      color: cGrey.shade600,
                    )
                  : SvgPicture.asset(
                      sShowPassword,
                      color: cGrey.shade600,
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
