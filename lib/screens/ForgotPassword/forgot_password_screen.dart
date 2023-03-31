import 'package:carteira_inteligente_app/constants/constants.dart';
import 'package:carteira_inteligente_app/utils/toast_message.dart';
import 'package:carteira_inteligente_app/widgets/Buttons/primary_button.dart';
import 'package:carteira_inteligente_app/widgets/Containers/form_container.dart';
import 'package:carteira_inteligente_app/widgets/Inputs/input_text.dart';
import 'package:carteira_inteligente_app/widgets/Labels/subtitle_label.dart';
import 'package:carteira_inteligente_app/widgets/Labels/title_label.dart';
import 'package:flutter/material.dart';

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
      ToastMessage.showWarning("Preencha todos os campos obrigatórios.");
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return FormContainer(
      Column(
        children: <Widget>[
          Row(
            children: const <Widget>[
              TitleLabel(
                "Esqueceu sua senha?",
              ),
            ],
          ),
          const SubtitleLabel(
            "Informe seu e-mail para que possamos enviar uma nova senha para você.",
          ),
          InputText(
            "E-mail",
            _emailController,
            TextInputType.emailAddress,
            _submitForm,
          ),
          Column(
            children: <Widget>[
              Container(
                alignment: Alignment.bottomCenter,
                padding: const EdgeInsets.all(10.0),
                child: PrimaryButton(
                  wLargeButtonMinimunSize,
                  "Enviar e-mail",
                  _submitForm,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
