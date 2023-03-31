import 'package:carteira_inteligente_app/utils/toast_message.dart';
import 'package:carteira_inteligente_app/constants/constants.dart';
import 'package:carteira_inteligente_app/widgets/Buttons/primary_button.dart';
import 'package:carteira_inteligente_app/widgets/Buttons/secondary_button.dart';
import 'package:carteira_inteligente_app/widgets/Containers/form_container.dart';
import 'package:carteira_inteligente_app/widgets/Labels/subtitle_label.dart';
import 'package:carteira_inteligente_app/widgets/Labels/title_label.dart';
import 'package:carteira_inteligente_app/widgets/Inputs/input_password.dart';
import 'package:carteira_inteligente_app/widgets/Inputs/input_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
    return FormContainer(
      Column(
        children: <Widget>[
          Row(
            children: const <Widget>[
              TitleLabel(
                "Vamos começar!",
              ),
            ],
          ),
          const SubtitleLabel(
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
                  SubtitleLabel(
                    "Sua senha deve conter pelo menos:",
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: <Widget>[
                    Row(
                      children: const <Widget>[
                        Text("・ Uma letra maiúscula e uma minúscula;"),
                      ],
                    ),
                    Row(
                      children: const <Widget>[
                        Text("・ Um número;"),
                      ],
                    ),
                    Row(
                      children: const <Widget>[
                        Text("・ Um caracter especial;"),
                      ],
                    ),
                    Row(
                      children: const <Widget>[
                        Text("・ Mínimo 8 caracteres."),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
          Column(
            children: <Widget>[
              PrimaryButton(
                wLargeButtonMinimunSize,
                "Cadastrar",
                _submitForm,
              ),
            ],
          )
        ],
      ),
    );
  }
}
