import 'package:carteira_inteligente_app/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ToastMessage {
  static void showToast(String message, Color bgColor, Color textColor) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.TOP,
      timeInSecForIosWeb: 5,
      backgroundColor: bgColor,
      textColor: textColor,
      fontSize: 16,
    );
  }

  static void showSuccess(String message) {
    showToast(
      message,
      cGreen,
      cWhite,
    );
  }

  static void showWarning(String message) {
    showToast(
      message,
      cYellow,
      cBlack,
    );
  }

  static void showDanger(String message) {
    showToast(
      message,
      cRed,
      cWhite,
    );
  }
}
