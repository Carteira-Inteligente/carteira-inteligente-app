import 'package:carteira_inteligente_app/constants/constants.dart';
import 'package:flutter/material.dart';

class CardButton extends StatelessWidget {
  const CardButton(this.text, this.onPressed, {super.key});

  final String text;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: cCustomCardButton,
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: wBorderRadius50,
            ),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(300, 10),
                shape: wButtonBorderRadius,
                backgroundColor: cTransparent,
                elevation: 0,
              ),
              onPressed: onPressed,
              child: Text(
                text,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
