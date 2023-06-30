import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../constants/svgs.dart';
import '../../constants/widgets.dart';
import '../Containers/input_containers.dart';

class InputSearch extends StatefulWidget {
  const InputSearch({
    super.key,
    required this.onChanged,
  });

  final void Function(String) onChanged;

  @override
  State<InputSearch> createState() => _InputSearchState();
}

class _InputSearchState extends State<InputSearch> {
  final TextEditingController _textEditingController = TextEditingController();

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: const BoxDecoration(
          color: cWhite,
          borderRadius: wInputBorderRadius,
        ),
        child: TextField(
          controller: _textEditingController,
          onChanged: widget.onChanged,
          style: Theme.of(context).textTheme.displaySmall,
          decoration: InputDecoration(
            border: const OutlineInputBorder(
              borderRadius: wInputBorderRadius,
              borderSide: BorderSide(color: cBlack),
            ),
            hintText: "Pesquisar",
            hintStyle: Theme.of(context).textTheme.displaySmall,
            prefixIcon: const InputIconContainer(svgIcon: sSearch),
            suffixIcon: _textEditingController.text.isEmpty
                ? null
                : IconButton(
                    icon: Icon(
                      Icons.clear,
                      color: cGrey.shade600,
                    ),
                    onPressed: () {
                      _textEditingController.clear();
                      widget.onChanged("");
                    },
                  ),
          ),
        ),
      ),
    );
  }
}
