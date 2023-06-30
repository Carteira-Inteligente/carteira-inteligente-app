import 'package:flutter/material.dart';

import '../constants/colors.dart';

class ShowModal {
  static void showModal(BuildContext context, Widget widget) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: cTransparent,
      elevation: 5,
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            decoration: const BoxDecoration(
              color: cWhite,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(20.0),
              ),
            ),
            child: Column(
              children: <Widget>[
                GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 16.0),
                    height: 4.0,
                    width: 100.0,
                    decoration: BoxDecoration(
                      color: cGrey.shade300,
                      borderRadius: BorderRadius.circular(2.0),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 10.0,
                    right: 10.0,
                    bottom: 15.0,
                  ),
                  child: widget,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
