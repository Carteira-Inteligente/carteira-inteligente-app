import 'package:carteira_inteligente_app/constants/constants.dart';
import 'package:carteira_inteligente_app/themes/dark_status_bar_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FormContainer extends StatelessWidget {
  const FormContainer(this.widget, {super.key});

  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: SvgPicture.asset(sArrowLeft),
        ),
        elevation: 0,
        backgroundColor: cTransparent,
        iconTheme: const IconThemeData(
          color: cBlack,
        ),
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
            color: cTransparent,
          ),
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: widget,
          ),
        ),
      ),
    );
  }
}
