import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../widgets/Buttons/primary_buttons.dart';
import '../widgets/Buttons/secondary_buttons.dart';
import '../widgets/Containers/dialog_container.dart';

class ShowDialog {
  static void deleteDialog(
    BuildContext context,
    String dataLabel,
    Function() onPressed,
  ) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return DialogContainer(
          dialogTitle: "Deseja excluir este $dataLabel?",
          contentText: Text.rich(
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
                    // fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          secondaryButton: const SmallSecondaryButton(),
          actionButton: SmallPrimaryButton(
            onPressed: onPressed,
            backgroundColor: cRed.shade800,
            label: "Excluir $dataLabel",
          ),
        );
      },
    );
  }

  static void cancelPayment(BuildContext context, Function() onPressed) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return DialogContainer(
          dialogTitle: "Deseja cancelar este pagamento?",
          contentText: Text(
            "Este lançamento ficará marcado como pendente até que você nos "
            "informe que já realizou o pagamento.",
            style: Theme.of(context).textTheme.displaySmall,
          ),
          secondaryButton: const SmallSecondaryButton(),
          actionButton: SmallPrimaryButton(
            onPressed: onPressed,
            backgroundColor: cBlue.shade800,
            label: "Cancelar pagamento",
          ),
        );
      },
    );
  }

  static void cancelDialog(BuildContext context, Function() onPressed) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return DialogContainer(
          dialogTitle: "Deseja cancelar este cadastro?",
          contentText: Text(
            "Este cadastro não será salvo e você perderá as informações "
            "preenchidas.",
            style: Theme.of(context).textTheme.displaySmall,
          ),
          secondaryButton: const SmallSecondaryButton(),
          actionButton: SmallPrimaryButton(
            onPressed: onPressed,
            backgroundColor: cBlue.shade800,
            label: "Cancelar cadastro",
          ),
        );
      },
    );
  }

  static void logoutDialog(BuildContext context, Function() onPressed) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return DialogContainer(
          dialogTitle: "Encerrar sessão",
          contentText: Text(
            "Tem certeza que deseja sair do aplicativo?",
            style: Theme.of(context).textTheme.displaySmall,
          ),
          secondaryButton: const SmallSecondaryButton(),
          actionButton: SmallPrimaryButton(
            onPressed: onPressed,
            backgroundColor: cBlue.shade800,
            label: "Sair do aplicativo",
          ),
        );
      },
    );
  }
}
