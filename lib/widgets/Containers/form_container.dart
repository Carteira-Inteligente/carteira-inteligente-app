import 'package:carteira_inteligente_app/constants/constants.dart';
import 'package:flutter/material.dart';

class FormContainer extends StatelessWidget {
  const FormContainer(this.widget, {super.key});

  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: cTransparent,
      ),
      height: MediaQuery.of(context).size.height,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: widget,
      ),
    );
  }
}
