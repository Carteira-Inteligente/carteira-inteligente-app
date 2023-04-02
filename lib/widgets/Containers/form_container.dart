import 'package:carteira_inteligente_app/constants/constants.dart';
import 'package:carteira_inteligente_app/widgets/AppBar/app_bar_leading.dart';
import 'package:carteira_inteligente_app/widgets/AppBar/app_bar_logo.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FormContainer extends StatelessWidget {
  const FormContainer(this.bodyWidget, this.bottonButton, {super.key});

  final Widget bodyWidget;
  final Widget bottonButton;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const AppBarLeading(),
        elevation: 0,
        backgroundColor: cWhite,
        iconTheme: const IconThemeData(
          color: cBlack,
        ),
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        title: const AppBarLogo(),
      ),
      body: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    decoration: const BoxDecoration(color: cWhite),
                    height: MediaQuery.of(context).size.height,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: bodyWidget,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              decoration: const BoxDecoration(color: cWhite),
              padding: const EdgeInsets.only(bottom: 15.0),
              child: bottonButton,
            ),
          ),
        ],
      ),
    );
  }
}
