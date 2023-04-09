import 'package:carteira_inteligente/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FilterButton extends StatelessWidget {
  const FilterButton(this.text, this.onPressed, {super.key});

  final String text;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(150, 30),
              shape: wButtonBorderRadius,
              side: const BorderSide(
                color: cBlue,
              ),
              backgroundColor: cWhite,
              elevation: 0,
            ),
            onPressed: onPressed,
            label: Text(
              text,
              style: Theme.of(context).textTheme.labelMedium,
            ),
            icon: GestureDetector(
              child: Transform.scale(
                scale: 0.7,
                child: SvgPicture.asset(
                  sFilter,
                  color: cBlue,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
