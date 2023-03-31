import 'package:carteira_inteligente_app/constants/constants.dart';
import 'package:flutter/material.dart';

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
            decoration: const BoxDecoration(
              color: cWhite,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(20.0),
              ),
            ),
            height: MediaQuery.of(context).size.height * 0.75,
            child: Column(
              children: <Widget>[
                GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 16.0),
                    height: 4.0,
                    width: 40.0,
                    decoration: BoxDecoration(
                      color: cGrey,
                      borderRadius: BorderRadius.circular(2.0),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20.0,
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
