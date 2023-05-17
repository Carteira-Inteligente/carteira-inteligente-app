import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../constants/colors.dart';
import '../../constants/widgets.dart';
import 'input_container.dart';

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
          decoration: wInputDecorarion,
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
