import 'package:flutter/material.dart';

import 'subtitle_label.dart';

class ListLabel extends StatelessWidget {
  const ListLabel({
    super.key,
    required this.label,
    this.padding,
  });

  final String label;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 5.0),
          child: SubtitleLabel(
            padding: padding,
            label: label,
          ),
        ),
      ],
    );
  }
}
