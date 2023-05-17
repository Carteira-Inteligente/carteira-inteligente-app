import 'package:carteira_inteligente/constants/colors.dart';
import 'package:flutter/material.dart';

// Widgets.Input
const wInputDecorarion = InputDecoration(
  border: OutlineInputBorder(
    borderRadius: wInputBorderRadius,
    borderSide: BorderSide(color: cBlack),
  ),
);
const wInputBorderRadius = BorderRadius.all(
  Radius.circular(15),
);

// Widgets.Button
const wSmallButtonMinimunSize = Size(170, 60);
const wLargeButtonMinimunSize = Size(350, 60);
const wRoundButtonSize = Size(60, 60);
const wButtonBorderRadius = RoundedRectangleBorder(
  borderRadius: wBorderRadius50,
);

// Widgets.Border
const wBorderRadius50 = BorderRadius.all(
  Radius.circular(50),
);

// Widgets.Card
var wCardShape = RoundedRectangleBorder(
  borderRadius: BorderRadius.circular(10),
  side: BorderSide(
    color: cGrey.shade200,
    width: 1,
  ),
);

// Widgets.Box
const wBoxDecoration = BoxDecoration(
  color: cWhite,
  borderRadius: wInputBorderRadius,
);
