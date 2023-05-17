import 'package:fluttertoast/fluttertoast.dart';

import '../constants/colors.dart';

class ToastMessage {
  static void showToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 5,
      backgroundColor: cBlueGrey.shade800,
      textColor: cWhite,
      fontSize: 18,
    );
  }
}
