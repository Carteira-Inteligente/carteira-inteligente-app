import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../widgets/Containers/modal_dialog_container.dart';

class DeleteModal extends StatelessWidget {
  const DeleteModal({
    super.key,
    required this.dataLabel,
    required this.onPressed,
  });

  final String dataLabel;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ModalDialogContainer(
      title: "Deseja excluir este $dataLabel?",
      onPressed: onPressed,
      textButton: "Excluir $dataLabel",
      deleteButton: true,
      child: Text.rich(
        TextSpan(
          text: "Todas informações associadas a este registro serão "
              "permanentemente removidas.\n",
          style: Theme.of(context).textTheme.displaySmall,
          children: const <TextSpan>[
            TextSpan(
              text: "Esta operação não poderá ser desfeita.",
              style: TextStyle(
                fontSize: 16,
                fontFamily: "OpenSans",
                color: cRed,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
