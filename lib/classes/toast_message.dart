import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../constants/constants.dart';

class ToastMessage {
  static void showToast(String message, Color bgColor, Color textColor) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 5,
      backgroundColor: bgColor,
      textColor: textColor,
      fontSize: 16,
    );
  }

  static void showSuccess(String message) {
    showToast(
      "${SvgPicture.asset(sSuccess, color: cWhite)} $message",
      cGreen,
      cWhite,
    );
  }

  static void showWarning(String message) {
    showToast(
      "${SvgPicture.asset(sDanger, color: cBlack)} $message",
      cYellow,
      cBlack,
    );
  }

  static void showDanger(String message) {
    showToast(
      "${SvgPicture.asset(sError, color: cWhite)} $message",
      cRed,
      cWhite,
    );
  }
}
