import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../constants/widgets.dart';

class CardContainer extends StatefulWidget {
  const CardContainer({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  State<CardContainer> createState() => _CardContainerState();
}

class _CardContainerState extends State<CardContainer> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: cWhite,
      elevation: 2,
      shape: wCardShape,
      child: widget.child,
    );
  }
}
