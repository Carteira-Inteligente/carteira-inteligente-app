import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../constants/colors.dart';

class ToastMessage {
  static void _showToast(
    String message,
    Color backgroundColor,
    Color textColor,
  ) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.TOP,
      timeInSecForIosWeb: 5,
      backgroundColor: backgroundColor,
      textColor: textColor,
      fontSize: 16,
    );
  }

  static void successToast(String message) {
    _showToast(
      message,
      cGreen.shade200.withOpacity(0.9),
      cGreen.shade900,
    );
  }

  static void dangerToast(String message) {
    _showToast(
      message,
      cRed.shade200.withOpacity(0.9),
      cRed.shade900,
    );
  }

  static void warningToast(String message) {
    _showToast(
      message,
      cYellow.shade200.withOpacity(0.9),
      cYellow.shade900,
    );
  }
}
