import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../constants/colors.dart';
import '../../constants/svgs.dart';
import '../../constants/widgets.dart';
import '../Containers/input_containers.dart';

class InputPassword extends StatefulWidget {
  const InputPassword({
    super.key,
    required this.label,
    required this.controller,
    required this.onSubmit,
    this.onChanged,
    this.passwordsMatch,
  });

  final String label;
  final TextEditingController controller;
  final void Function() onSubmit;
  final void Function(String)? onChanged;
  final bool? passwordsMatch;

  @override
  State<InputPassword> createState() => _InputPasswordState();
}

class _InputPasswordState extends State<InputPassword> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return InputContainer(
      label: widget.label,
      child: TextField(
        cursorColor: widget.passwordsMatch == false ? cRed : cBlue.shade800,
        onChanged: widget.onChanged,
        style: Theme.of(context).textTheme.displaySmall,
        obscureText: _obscureText,
        controller: widget.controller,
        onSubmitted: (_) => widget.onSubmit,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderRadius: wInputBorderRadius,
            borderSide: BorderSide(
              color: widget.passwordsMatch == false ? cRed : cBlue.shade800,
              width: 2.0,
            ),
          ),
          border: const OutlineInputBorder(
            borderRadius: wInputBorderRadius,
            borderSide: BorderSide(color: cBlack),
          ),
          suffixIcon: GestureDetector(
            onTap: () => setState(() {
              _obscureText = !_obscureText;
            }),
            child: Transform.scale(
              scale: 0.5,
              child: _obscureText
                  ? SvgPicture.asset(
                      sHidePassword,
                      color: widget.passwordsMatch == false
                          ? cRed
                          : cGrey.shade600,
                    )
                  : SvgPicture.asset(
                      sShowPassword,
                      color: widget.passwordsMatch == false
                          ? cRed
                          : cGrey.shade600,
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
