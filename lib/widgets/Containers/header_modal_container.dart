import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../Labels/title_labels.dart';

class HeaderModalContainer extends StatelessWidget {
  const HeaderModalContainer({
    super.key,
    required this.label,
  });

  final String label;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Align(
          alignment: Alignment.center,
          child: ModalTitleLabel(label: label),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: IconButton(
            padding: const EdgeInsets.only(bottom: 24.0),
            onPressed: () => Navigator.pop(context),
            icon: Container(
              padding: const EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                color: cGrey.shade200,
                borderRadius: BorderRadius.circular(50),
              ),
              child: Icon(
                Icons.close,
                color: cGrey.shade600,
                size: 14,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
