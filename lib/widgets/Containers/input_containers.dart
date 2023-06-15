import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../constants/colors.dart';
import '../../constants/widgets.dart';
import '../Labels/input_label.dart';

class InputContainer extends StatelessWidget {
  const InputContainer({
    super.key,
    required this.label,
    required this.child,
  });

  final String label;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Column(
        children: <Widget>[
          InputLabel(label: label),
          Padding(
            padding: const EdgeInsets.only(top: 2.0),
            child: Container(
              decoration: wBoxDecoration,
              child: child,
            ),
          ),
        ],
      ),
    );
  }
}

class InkwellContainer extends StatelessWidget {
  const InkwellContainer({
    super.key,
    required this.label,
    required this.text,
    required this.icon,
    required this.onTap,
  });

  final String label;
  final String text;
  final String icon;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InputContainer(
      label: label,
      child: InkWell(
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

class InputIconContainer extends StatelessWidget {
  const InputIconContainer({
    super.key,
    required this.svgIcon,
  });

  final String svgIcon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Transform.scale(
        scale: 0.5,
        child: SvgPicture.asset(
          svgIcon,
          color: cGrey.shade600,
        ),
      ),
    );
  }
}
