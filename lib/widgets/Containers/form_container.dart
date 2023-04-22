import 'package:carteira_inteligente/constants/constants.dart';
import 'package:carteira_inteligente/widgets/AppBar/app_bar_leading.dart';
import 'package:carteira_inteligente/widgets/AppBar/app_bar_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FormContainer extends StatelessWidget {
  const FormContainer(this.title, this.bodyWidget, this.bottonButton,
      {super.key});

  final String title;
  final Widget bodyWidget;
  final Widget bottonButton;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const AppBarLeading(),
        elevation: 0,
        backgroundColor: Theme.of(context).primaryColor,
        systemOverlayStyle: SystemUiOverlayStyle.light,
        title: AppBarTitle(title),
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
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20.0,
                        vertical: 10.0,
                      ),
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
