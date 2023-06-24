import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../models/users.dart';
import '../../utils/password_rules.dart';
import '../../utils/toast_message.dart';
import '../../widgets/Buttons/primary_buttons.dart';
import '../../widgets/Containers/form_containers.dart';
import '../../widgets/Containers/password_rules_container.dart';
import '../../widgets/Inputs/input_email.dart';
import '../../widgets/Inputs/input_password.dart';
import '../../widgets/Inputs/input_text.dart';

class EditUserFormScreen extends StatefulWidget {
  const EditUserFormScreen({
    super.key,
    required this.user,
    required this.onSubmit,
  });

  final Users user;
  final void Function(
    String,
    String,
    String,
  ) onSubmit;

  @override
  State<EditUserFormScreen> createState() => _EditUserFormScreenState();
}

class _EditUserFormScreenState extends State<EditUserFormScreen> {
  late TextEditingController _nameController;
  late TextEditingController _emailController;
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(
      text: widget.user.name,
    );
    _emailController = TextEditingController(
      text: widget.user.email,
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  _submitForm() async {
    final name = _nameController.text;
    final email = _emailController.text;
    final password = _passwordController.text;
    final confirmPassword = _confirmPasswordController.text;

    if (password != confirmPassword) {
      ToastMessage.warningToast("As senhas não coincidem.");
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
      title: "Edição de usuário",
      height: MediaQuery.of(context).size.height * 0.69,
      bottonButton: PrimaryButton(
        textButton: "Salvar",
        onPressed: _submitForm,
      ),
      child: Column(
        children: <Widget>[
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
          ),
          PasswordRulesContainer(labelColor: passwordLabelColor),
        ],
      ),
    );
  }
}
