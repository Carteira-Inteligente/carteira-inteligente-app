import 'package:flutter/material.dart';

import '../../widgets/Buttons/secondary_button.dart';
import '../../widgets/Containers/form_container.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return FormContainer(
      title: "Notificações",
      bottonButton: SecondaryButton(
        textButton: "Limpar tudo",
        onPressed: () {},
      ),
      child: Container(),
    );
  }
}
