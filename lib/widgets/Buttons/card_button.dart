import 'package:carteira_inteligente_app/constants/constants.dart';
import 'package:carteira_inteligente_app/widgets/Containers/card_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CardButton extends StatelessWidget {
  const CardButton(this.text, this.onPressed, {super.key});

  final String text;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          elevation: 2,
          shape: wCardShape,
          fixedSize: Size(
            MediaQuery.of(context).size.width * 0.5,
            170,
          ),
          backgroundColor: cWhite,
        ),
        child: Column(
          children: [
            SvgPicture.asset(
              sAdd,
              color: cBlack,
            ),
            Text(
              text,
              style: TextStyle(color: cBlack),
            )
          ],
        ),
      ),
    );
  }
}
