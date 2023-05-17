import 'package:flutter/material.dart';

import 'subtitle_label.dart';

class ListLabel extends StatelessWidget {
  const ListLabel({
    super.key,
    required this.label,
  });

  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 5.0),
          child: SubtitleLabel(label: label),
        ),
      ],
    );
  }
}
