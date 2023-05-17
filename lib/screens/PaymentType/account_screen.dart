import 'package:flutter/material.dart';

import '../../widgets/Containers/screen_form_container.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    return ScreenFormContainer(
      title: "Contas",
      tooltip: "Nova conta",
      onPressed: () {
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) => CategoriesFormScreen(),
        //   ),
        // );
      },
      child: const Placeholder(),
    );
  }
}
