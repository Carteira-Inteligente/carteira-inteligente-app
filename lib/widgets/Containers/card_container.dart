import 'package:carteira_inteligente_app/constants/constants.dart';
import 'package:flutter/material.dart';

class CardContainer extends StatefulWidget {
  const CardContainer(this.widget, {super.key});

  final Widget widget;

  @override
  State<CardContainer> createState() => _CardContainerState();
}

class _CardContainerState extends State<CardContainer> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: cWhite,
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(
          color: cGrey.shade200,
          width: 1,
        ),
      ),
      child: widget.widget,
    );
  }
}
