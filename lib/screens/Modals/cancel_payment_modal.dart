import 'package:flutter/material.dart';

import '../../widgets/Containers/modal_dialog_container.dart';

class CancelPaymentModal extends StatelessWidget {
  const CancelPaymentModal({
    super.key,
    required this.onPressed,
  });

  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ModalDialogContainer(
      title: "Deseja cancelar este pagamento?",
      onPressed: onPressed,
      textButton: "Cancelar pagamento",
      child: Text(
        "Este lançamento ficará marcado como pendente até que você nos "
        "informe que já realizou o pagamento.",
        style: Theme.of(context).textTheme.displaySmall,
      ),
    );
  }
}
