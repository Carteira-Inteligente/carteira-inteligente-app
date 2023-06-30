import 'package:flutter/material.dart';

import '../../widgets/Containers/modal_dialog_container.dart';

class LogoutModal extends StatelessWidget {
  const LogoutModal({
    super.key,
    required this.onPressed,
  });

  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ModalDialogContainer(
      title: "Encerrar sessão",
      onPressed: onPressed,
      textButton: "Sair do aplicativo",
      child: Text(
        "Tem certeza que deseja sair do aplicativo?",
        style: Theme.of(context).textTheme.displaySmall,
      ),
    );
  }
}
