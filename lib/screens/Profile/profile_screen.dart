import 'package:carteira_inteligente/themes/dark_status_bar_theme.dart';
import 'package:carteira_inteligente/widgets/Labels/title_label.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return const DarkStatusBarTheme(
      TitleLabel("Perfil"),
    );
  }
}
