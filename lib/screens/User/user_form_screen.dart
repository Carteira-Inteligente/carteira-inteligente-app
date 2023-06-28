import 'package:flutter/material.dart';

import '../../utils/messages_utils.dart';
import '../../utils/password_rules.dart';
import '../../utils/toast_message.dart';
import '../../widgets/Buttons/primary_buttons.dart';
import '../../widgets/Containers/form_containers.dart';
import '../../widgets/Containers/password_rules_container.dart';
import '../../widgets/Inputs/input_email.dart';
import '../../widgets/Inputs/input_password.dart';
import '../../widgets/Inputs/input_text.dart';
import '../../widgets/Labels/title_labels.dart';

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
  bool _hasLowerCase = false;
  bool _hasUpperCase = false;
  bool _hasSpecialCharacters = false;
  bool _hasNumber = false;
  bool _hasLength = false;
  bool _passwordsMatch = true;

  void _validatePassword(String password) {
    setState(() {
      _isPasswordValid = PasswordRules().passwordMustHave(password);
      _hasLowerCase = PasswordRules().checkLowerCase(password);
      _hasUpperCase = PasswordRules().checkUpperCase(password);
      _hasSpecialCharacters = PasswordRules().checkSpecialCharacters(password);
      _hasNumber = PasswordRules().checkNumber(password);
      _hasLength = PasswordRules().checkLength(password);
    });
  }

  _submitForm() async {
    final name = _nameController.text;
    final email = _emailController.text;
    final password = _passwordController.text;
    final confirmPassword = _confirmPasswordController.text;

    if (password != confirmPassword) {
      ToastMessage.warningToast(MessagesUtils.notMatchPassword());
      setState(() {
        _passwordsMatch = false;
      });
      return;
    }

    setState(() {
      _passwordsMatch = true;
    });

    if (_isPasswordValid == false) {
      ToastMessage.warningToast(MessagesUtils.noSecurePassword());
      return;
    }

    widget.onSubmit(name, email, password);
  }

  @override
  Widget build(BuildContext context) {
    return FormContainer(
      title: "Vamos começar!",
      height: MediaQuery.of(context).size.height * 0.75,
      bottomButton: PrimaryButton(
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
            passwordsMatch: _passwordsMatch,
          ),
          PasswordRulesContainer(
            hasLowerCase: _hasLowerCase,
            hasUpperCase: _hasUpperCase,
            hasSpecialCharacters: _hasSpecialCharacters,
            hasNumber: _hasNumber,
            hasLength: _hasLength,
          ),
        ],
      ),
    );
  }
}
