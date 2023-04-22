import 'package:carteira_inteligente/utils/toast_message.dart';
import 'package:carteira_inteligente/constants/constants.dart';
import 'package:carteira_inteligente/widgets/Buttons/primary_button.dart';
import 'package:carteira_inteligente/widgets/Containers/form_container.dart';
import 'package:carteira_inteligente/widgets/Inputs/input_email.dart';
import 'package:carteira_inteligente/widgets/Labels/password_pattern_label.dart';
import 'package:carteira_inteligente/widgets/Labels/subtitle_label.dart';
import 'package:carteira_inteligente/widgets/Labels/title_label.dart';
import 'package:carteira_inteligente/widgets/Inputs/input_password.dart';
import 'package:carteira_inteligente/widgets/Inputs/input_text.dart';
import 'package:flutter/material.dart';

class UserFormScreen extends StatefulWidget {
  const UserFormScreen(this.onSubmit, {super.key});

  final void Function(String, String, String) onSubmit;

  @override
  State<UserFormScreen> createState() => _UserFormScreenState();
}

class _UserFormScreenState extends State<UserFormScreen> {
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
      ToastMessage.showToast("Preencha todos os campos obrigatórios.");
      return;
    }

    widget.onSubmit(name, email, password);
    ToastMessage.showToast("Usuário cadastrado do sucesso.");
  }

  @override
  Widget build(BuildContext context) {
    return FormContainer(
      "Novo usuário",
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
            "Digite seu nome ou apelido",
            _nameController,
            _submitForm,
          ),
          InputEmail(
            "E-mail",
            _emailController,
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
            children: <Widget>[
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
                  children: const <Widget>[
                    PasswordPatternLabel(
                      "・ Uma letra maiúscula e uma minúscula;",
                    ),
                    PasswordPatternLabel("・ Um número;"),
                    PasswordPatternLabel("・ Um caracter especial;"),
                    PasswordPatternLabel("・ Mínimo 8 caracteres."),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      PrimaryButton(
        wLargeButtonMinimunSize,
        "Cadastrar",
        _submitForm,
      ),
    );
  }
}
