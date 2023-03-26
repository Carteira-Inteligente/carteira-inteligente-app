import 'package:fluttertoast/fluttertoast.dart';

import '../constants/constants.dart';

class ToastMessage {
  static void showSuccess(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 5,
      backgroundColor: cGreen,
      textColor: cWhite,
      fontSize: 16,
    );
  }

  static void showWarning(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 5,
      backgroundColor: cYellow,
      textColor: cBlack,
      fontSize: 16,
    );
  }

  static void showDanger(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 5,
      backgroundColor: cRed,
      textColor: cWhite,
      fontSize: 16,
    );
  }
}
