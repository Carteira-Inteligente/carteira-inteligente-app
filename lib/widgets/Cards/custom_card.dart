import 'package:carteira_inteligente/widgets/Buttons/card_button.dart';
import 'package:carteira_inteligente/widgets/Containers/card_container.dart';
import 'package:flutter/material.dart';

class CustomCard extends StatefulWidget {
  const CustomCard(this.cardText, this.buttonText, this.onPressedButton,
      {super.key});

  final String cardText;
  final String buttonText;
  final void Function() onPressedButton;

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  @override
  Widget build(BuildContext context) {
    return CardContainer(
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              widget.cardText,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          CardButton(
            widget.buttonText,
            widget.onPressedButton,
          ),
        ],
      ),
    );
  }
}
