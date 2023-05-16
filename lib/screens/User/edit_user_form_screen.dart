import 'package:carteira_inteligente/utils/toast_message.dart';
import 'package:carteira_inteligente/constants/constants.dart';
import 'package:carteira_inteligente/widgets/Buttons/primary_button.dart';
import 'package:carteira_inteligente/widgets/Containers/form_container.dart';
import 'package:carteira_inteligente/widgets/Inputs/input_email.dart';
import 'package:carteira_inteligente/widgets/Labels/password_rules_label.dart';
import 'package:carteira_inteligente/widgets/Inputs/input_password.dart';
import 'package:carteira_inteligente/widgets/Inputs/input_text.dart';
import 'package:flutter/material.dart';

class EditUserFormScreen extends StatefulWidget {
  const EditUserFormScreen(this.onSubmit, {super.key});

  final void Function(String, String, String) onSubmit;

  @override
  State<EditUserFormScreen> createState() => _EditUserFormScreenState();
}

class _EditUserFormScreenState extends State<EditUserFormScreen> {
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
    ToastMessage.showToast("Usuário alterado do sucesso.");
  }

  @override
  Widget build(BuildContext context) {
    return FormContainer(
      "Edição de usuário",
      Column(
        children: <Widget>[
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
          const PasswordRulesLabel(),
        ],
      ),
      PrimaryButton(
        wLargeButtonMinimunSize,
        "Salvar",
        _submitForm,
      ),
    );
  }
}
