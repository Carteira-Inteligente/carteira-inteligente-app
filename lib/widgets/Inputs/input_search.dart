import 'package:carteira_inteligente_app/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class InputSearch extends StatefulWidget {
  const InputSearch({super.key});

  @override
  State<InputSearch> createState() => _InputSearchState();
}

class _InputSearchState extends State<InputSearch> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          decoration: const BoxDecoration(
            color: cWhite,
            borderRadius: wInputBorderRadius,
          ),
          child: TextField(
            decoration: InputDecoration(
              border: const OutlineInputBorder(
                borderRadius: wInputBorderRadius,
                borderSide: BorderSide(
                  color: cBlack,
                ),
              ),
              hintText: "Buscar",
              suffixIcon: GestureDetector(
                child: Transform.scale(
                  scale: 0.5,
                  child: SvgPicture.asset(sSearch),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
