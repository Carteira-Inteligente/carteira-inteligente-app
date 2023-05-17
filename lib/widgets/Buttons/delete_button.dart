import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../constants/colors.dart';
import '../../constants/svgs.dart';
import '../../constants/widgets.dart';
import '../../utils/show_dialog.dart';
import '../Containers/button_container.dart';

class DeleteButton extends StatelessWidget {
  const DeleteButton(this.dataLabel, this.onPressed, {super.key});

  final String dataLabel;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ButtonContainer(
      ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          minimumSize: Size(MediaQuery.of(context).size.width * 0.4, 60),
          shape: wButtonBorderRadius,
          backgroundColor: cRed,
          elevation: 0,
        ),
        onPressed: () => ShowDialog.deleteDialog(context, dataLabel, onPressed),
        icon: SvgPicture.asset(
          sDelete,
          color: cWhite,
        ),
        label: Text(
          "Excluir",
          style: Theme.of(context).textTheme.labelLarge,
        ),
      ),
    );
  }
}
