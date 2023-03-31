import 'package:carteira_inteligente_app/utils/toast_message.dart';
import 'package:carteira_inteligente_app/constants/constants.dart';
import 'package:carteira_inteligente_app/widgets/Buttons/primary_button.dart';
import 'package:carteira_inteligente_app/widgets/Buttons/secondary_button.dart';
import 'package:carteira_inteligente_app/widgets/Containers/form_container.dart';
import 'package:carteira_inteligente_app/widgets/Containers/subtitle_screen_container.dart';
import 'package:carteira_inteligente_app/widgets/Containers/title_screen_container.dart';
import 'package:carteira_inteligente_app/widgets/Inputs/input_password.dart';
import 'package:carteira_inteligente_app/widgets/Inputs/input_text.dart';
import 'package:flutter/material.dart';

class CreateUserScreen extends StatefulWidget {
  const CreateUserScreen(this.onSubmit, {super.key});

  final void Function(String, String, String) onSubmit;

  @override
  State<CreateUserScreen> createState() => _CreateUserScreenState();
}

class _CreateUserScreenState extends State<CreateUserScreen> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  _submitForm() {
    final name = _nameController.text;
    final email = _emailController.text;
    final password = _passwordController.text;
    final confirmPassword = _confirmPasswordController.text;

    if (name.isEmpty ||
        email.isEmpty ||
        password.isEmpty ||
        confirmPassword.isEmpty) {
      ToastMessage.showWarning("Preencha todos os campos obrigatórios.");
      return;
    }

    widget.onSubmit(name, email, password);
    ToastMessage.showSuccess("Usuário cadastrado do sucesso.");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FormContainer(
        Padding(
          padding: const EdgeInsets.only(top: 50),
          child: Column(
            children: <Widget>[
              Row(
                children: const <Widget>[
                  TitleScreenContainer(
                    "Vamos começar!",
                  ),
                ],
              ),
              const SubtitleScreenContainer(
                "Preencha os campos abaixo para criar seu usuário.",
              ),
              InputText(
                "Nome completo",
                _nameController,
                TextInputType.text,
                _submitForm,
              ),
              InputText(
                "E-mail",
                _emailController,
                TextInputType.emailAddress,
                _submitForm,
              ),
              InputPassword(
                "Senha",
                _passwordController,
                _submitForm,
              ),
              InputPassword(
                "Confirmar senha",
                _confirmPasswordController,
                _submitForm,
              ),
              Column(
                children: [
                  Row(
                    children: const <Widget>[
                      SubtitleScreenContainer(
                        "Sua senha deve conter pelo menos:",
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: const <Widget>[
                        Text(
                          "・ Uma letra maiúsculas e um minúscula;\n・ Um número;\n・ Um caracter especiais;\n・ Mínimo 8 caracteres.",
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: SecondaryButton(
                      wSmallButtonMinimunSize,
                      "Cancelar",
                      () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  Expanded(
                    child: PrimaryButton(
                      wSmallButtonMinimunSize,
                      "Cadastrar",
                      _submitForm,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
