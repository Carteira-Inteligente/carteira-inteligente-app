import 'package:carteira_inteligente/constants/constants.dart';
import 'package:carteira_inteligente/widgets/Containers/input_icon_container.dart';
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
    return Container(
      decoration: const BoxDecoration(
        color: cWhite,
        borderRadius: wInputBorderRadius,
      ),
      child: TextField(
        style: Theme.of(context).textTheme.displaySmall,
        decoration: InputDecoration(
          border: const OutlineInputBorder(
            borderRadius: wInputBorderRadius,
            borderSide: BorderSide(
              color: cBlack,
            ),
          ),
          hintText: "Pesquisar",
          hintStyle: Theme.of(context).textTheme.displaySmall,
          suffixIcon: const InputIconContainer(sSearch),
        ),
      ),
    );
  }
}
