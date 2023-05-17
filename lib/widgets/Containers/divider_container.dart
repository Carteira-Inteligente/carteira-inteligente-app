import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class DividerContainer extends StatelessWidget {
  const DividerContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Divider(color: cGrey.shade400);
  }
}
