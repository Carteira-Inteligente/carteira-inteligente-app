import 'package:carteira_inteligente_app/constants/constants.dart';
import 'package:carteira_inteligente_app/widgets/Containers/input_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/flutter_svg.dart';

class InkwellContainer extends StatelessWidget {
  const InkwellContainer(this.label, this.text, this.icon, this.onTap,
      {super.key});

  final String label;
  final String text;
  final String icon;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InputContainer(
      label,
      InkWell(
        onTap: onTap,
        child: InputDecorator(
          decoration: const InputDecoration(
            border: OutlineInputBorder(
              borderRadius: wInputBorderRadius,
              borderSide: BorderSide(
                color: cBlack,
              ),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                text,
                style: Theme.of(context).textTheme.displaySmall,
              ),
              SvgPicture.asset(
                icon,
                color: cGrey.shade600,
              ),
            ],
          ),
        ),
      ),
    );
  }
}