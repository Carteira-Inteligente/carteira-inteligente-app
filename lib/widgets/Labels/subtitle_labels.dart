import 'package:flutter/material.dart';

import 'list_tile_label.dart';

class SubtitleLabel extends StatelessWidget {
  const SubtitleLabel({
    super.key,
    this.padding,
    required this.label,
  });

  final String label;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        padding: padding,
        child: Text(
          label,
          style: Theme.of(context).textTheme.titleSmall,
        ),
      ),
    );
  }
}

class BoldSubtitleLabel extends StatelessWidget {
  const BoldSubtitleLabel({
    super.key,
    required this.label,
    this.padding,
  });

  final String label;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      child: Text(
        label,
        style: Theme.of(context).textTheme.titleMedium,
      ),
    );
  }
}

class SubtitleListLabel extends StatelessWidget {
  const SubtitleListLabel({
    super.key,
    required this.label,
  });

  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTileLabel(label: label),
        ),
      ],
    );
  }
}
