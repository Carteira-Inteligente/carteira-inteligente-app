import 'package:carteira_inteligente/constants/constants.dart';
import 'package:carteira_inteligente/widgets/Buttons/dialog_action_button.dart';
import 'package:carteira_inteligente/widgets/Buttons/dialog_secondary_button.dart';
import 'package:carteira_inteligente/widgets/Containers/dialog_container.dart';
import 'package:flutter/material.dart';

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
          "Deseja excluir este $dataLabel?",
          Text.rich(
            TextSpan(
              text:
                  "Todas informações associadas a este registro serão permanentemente removidas.\n",
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
          const DialogSecondaryButton(),
          DialogActionButton(
            onPressed,
            cRed,
            "Excluir $dataLabel",
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
          "Deseja cancelar este pagamento?",
          Text(
            "Este lançamento ficará marcado como pendente até que você nos informe que já realizou o pagamento.",
            style: Theme.of(context).textTheme.displaySmall,
          ),
          const DialogSecondaryButton(),
          DialogActionButton(
            onPressed,
            cBlue,
            "Cancelar pagamento",
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
          "Deseja cancelar este cadastro?",
          Text(
            "Este cadastro não será salvo e você perderá as informações preenchidas.",
            style: Theme.of(context).textTheme.displaySmall,
          ),
          const DialogSecondaryButton(),
          DialogActionButton(
            onPressed,
            cBlue,
            "Cancelar cadastro",
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
          "Encerrar sessão",
          Text(
            "Tem certeza que deseja sair do aplicativo?",
            style: Theme.of(context).textTheme.displaySmall,
          ),
          const DialogSecondaryButton(),
          DialogActionButton(
            onPressed,
            cBlue,
            "Sair do aplicativo",
          ),
        );
      },
    );
  }
}
