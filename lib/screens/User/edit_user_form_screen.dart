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

    widget.onSubmit(name, email, password);
    ToastMessage.showToast("Usuário alterado do sucesso.");
  }

  void _validatePassword(String password) {
    setState(() {
      _isPasswordValid = PasswordRules().passwordMustHave(password);
    });
  }

  @override
  Widget build(BuildContext context) {
    Color passwordLabelColor = _isPasswordValid ? cGreen : cRed;

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
            _validatePassword,
          ),
          InputPassword(
            "Confirmar senha",
            _confirmPasswordController,
            _submitForm,
            (_) {},
          ),
          PasswordRulesContainer(passwordLabelColor),
        ],
      ),
      PrimaryButton(
        "Salvar",
        _submitForm,
      ),
    );
  }
}
