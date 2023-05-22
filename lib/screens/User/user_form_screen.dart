import 'package:carteira_inteligente/widgets/Labels/title_label.dart';
import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../utils/password_rules.dart';
import '../../utils/toast_message.dart';
import '../../widgets/Buttons/primary_button.dart';
import '../../widgets/Containers/form_container.dart';
import '../../widgets/Containers/password_rules_container.dart';
import '../../widgets/Inputs/input_email.dart';
import '../../widgets/Inputs/input_password.dart';
import '../../widgets/Inputs/input_text.dart';

class UserFormScreen extends StatefulWidget {
  const UserFormScreen({
    super.key,
    required this.onSubmit,
  });

  final void Function(
    String,
    String,
    String,
  ) onSubmit;

  @override
  State<UserFormScreen> createState() => _UserFormScreenState();
}

class _UserFormScreenState extends State<UserFormScreen> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  bool _isPasswordValid = false;

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

    if (!_isPasswordValid) {
      ToastMessage.showToast("A senha não atende aos requisitos.");
      return;
    }

    if (password != confirmPassword) {
      ToastMessage.showToast("A confirmação de senha não coincide.");
      return;
    }

    widget.onSubmit(name, email, password);
    ToastMessage.showToast("Usuário cadastrado com sucesso.");
  }

  void _validatePassword(String password) {
    setState(() {
      _isPasswordValid = PasswordRules().passwordMustHave(password);
    });
  }

  @override
  Widget build(BuildContext context) {
    Color passwordLabelColor = _isPasswordValid ? cGreen : cGrey.shade600;

    return FormContainer(
      title: "Vamos começar!",
      height: MediaQuery.of(context).size.height * 0.75,
      bottonButton: PrimaryButton(
        textButton: "Cadastrar",
        onPressed: _submitForm,
      ),
      child: Column(
        children: <Widget>[
          const TitleLabel(
            label: "Preencha os campos abaixo para criar seu usuário.",
          ),
          InputText(
            label: "Digite seu nome ou apelido",
            controller: _nameController,
            onSubmit: _submitForm,
          ),
          InputEmail(
            label: "E-mail",
            controller: _emailController,
            onSubmit: _submitForm,
          ),
          InputPassword(
            label: "Senha",
            controller: _passwordController,
            onSubmit: _submitForm,
            onChanged: _validatePassword,
          ),
          InputPassword(
            label: "Confirmar senha",
            controller: _confirmPasswordController,
            onSubmit: _submitForm,
            onChanged: (_) {},
          ),
          PasswordRulesContainer(labelColor: passwordLabelColor),
        ],
      ),
    );
  }
}
