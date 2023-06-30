import 'package:flutter/material.dart';

import '../../utils/messages_utils.dart';
import '../../utils/toast_message.dart';
import '../../widgets/Buttons/primary_buttons.dart';
import '../../widgets/Containers/form_containers.dart';
import '../../widgets/Inputs/input_email.dart';
import '../../widgets/Labels/title_labels.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _emailController = TextEditingController();

  _submitForm() {
    final email = _emailController.text;

    if (email.isEmpty) {
      ToastMessage.warningToast(MessagesUtils.notEmptyFields());
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return FormContainer(
      title: "Esqueceu sua senha?",
      bottomButton: PrimaryButton(
        textButton: "Enviar e-mail",
        onPressed: _submitForm,
      ),
      child: Column(
        children: <Widget>[
          const TitleLabel(
            label: "Informe seu e-mail para que possamos enviar uma nova "
                "senha para você.",
          ),
          InputEmail(
            label: "E-mail",
            controller: _emailController,
            onSubmit: _submitForm,
          ),
        ],
      ),
    );
  }
}
