import 'package:carteira_inteligente/constants/colors.dart';
import 'package:carteira_inteligente/constants/svgs.dart';
import 'package:carteira_inteligente/constants/widgets.dart';
import 'package:carteira_inteligente/widgets/Containers/input_icon_container.dart';
import 'package:flutter/material.dart';

class InputSearch extends StatefulWidget {
  const InputSearch({super.key});

  @override
  State<InputSearch> createState() => _InputSearchState();
}

class _InputSearchState extends State<InputSearch> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Container(
        decoration: const BoxDecoration(
          color: cWhite,
          borderRadius: wInputBorderRadius,
        ),
        child: TextField(
          style: Theme.of(context).textTheme.displaySmall,
          decoration: InputDecoration(
            border: const OutlineInputBorder(
              borderRadius: wInputBorderRadius,
              borderSide: BorderSide(color: cBlack),
            ),
            hintText: "Pesquisar",
            hintStyle: Theme.of(context).textTheme.displaySmall,
            suffixIcon: const InputIconContainer(sSearch),
          ),
        ),
      ),
    );
  }
}
