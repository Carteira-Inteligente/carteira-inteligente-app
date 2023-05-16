import 'package:carteira_inteligente/constants/constants.dart';
import 'package:carteira_inteligente/widgets/AppBar/app_bar_leading.dart';
import 'package:carteira_inteligente/widgets/AppBar/app_bar_title.dart';
import 'package:carteira_inteligente/widgets/Buttons/primary_button.dart';
import 'package:carteira_inteligente/widgets/Buttons/secondary_button.dart';
import 'package:carteira_inteligente/widgets/Containers/form_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return FormContainer(
      "Notificações",
      const Placeholder(),
      SecondaryButton(
        wLargeButtonMinimunSize,
        "Limpar tudo",
        () {},
      ),
    );
  }
}
