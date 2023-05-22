import 'package:carteira_inteligente/constants/colors.dart';
import 'package:carteira_inteligente/constants/svgs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PasswordPatternLabel extends StatelessWidget {
  const PasswordPatternLabel({
    super.key,
    required this.label,
    required this.labelColor,
  });

  final String label;
  final Color labelColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 1.5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          labelColor == cGreen
              ? SvgPicture.asset(
                  sSuccess,
                  color: labelColor,
                )
              : SvgPicture.asset(
                  sError,
                  color: labelColor,
                ),
          Text(
            label,
            style: TextStyle(
              fontFamily: "OpenSans",
              fontSize: 16,
              fontWeight: FontWeight.normal,
              color: labelColor,
            ),
          ),
        ],
      ),
    );
  }
}
