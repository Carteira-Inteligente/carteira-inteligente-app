import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../utils/password_rules.dart';
import '../../utils/toast_message.dart';
import '../../widgets/Buttons/primary_buttons.dart';
import '../../widgets/Containers/form_containers.dart';
import '../../widgets/Containers/password_rules_container.dart';
import '../../widgets/Inputs/input_email.dart';
import '../../widgets/Inputs/input_password.dart';
import '../../widgets/Inputs/input_text.dart';
import '../../widgets/Labels/title_label.dart';

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

  _submitForm() async {
    final name = _nameController.text;
    final email = _emailController.text;
    final password = _passwordController.text;
    final confirmPassword = _confirmPasswordController.text;

    if (name.isEmpty ||
        email.isEmpty ||
        password.isEmpty ||
        confirmPassword.isEmpty) {
      ToastMessage.warningToast("Preencha todos os campos obrigatórios.");
      return;
    }

    widget.onSubmit(name, email, password);
  }

  bool _isPasswordValid = false;

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
        onPressed: _submitForm, //_submitForm,
      ),
      child: Column(
        children: <Widget>[
          const TitleLabel(
            label: "Preencha os campos abaixo para criar seu usuário.",
          ),
          InputText(
            label: "Digite seu nome ou apelido",
            controller: _nameController,
            onSubmit: _submitForm, //_submitForm,
          ),
          InputEmail(
            label: "E-mail",
            controller: _emailController,
            onSubmit: _submitForm, // _submitForm,
          ),
          InputPassword(
            label: "Senha",
            controller: _passwordController,
            onSubmit: _submitForm, // _submitForm,
            onChanged: _validatePassword,
          ),
          InputPassword(
            label: "Confirmar senha",
            controller: _confirmPasswordController,
            onSubmit: _submitForm, //_submitForm,
          ),
          PasswordRulesContainer(labelColor: passwordLabelColor),
        ],
      ),
    );
  }
}
