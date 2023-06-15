import 'dart:math';

import 'package:carteira_inteligente/screens/Initial/initial_screen.dart';
import 'package:flutter/material.dart';

import '../../constants/images.dart';
import '../../constants/svgs.dart';
import '../../models/budget.dart';
import '../../widgets/Cards/list_cards.dart';
import '../../widgets/Containers/divider_container.dart';
import '../../widgets/Labels/list_label.dart';
import '../Budget/budget_form_screen.dart';
import '../Category/category_screen.dart';
import '../PaymentType/account_screen.dart';
import '../PaymentType/credit_card_screen.dart';

class DrawerScreen extends StatefulWidget {
  const DrawerScreen({super.key});

  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  final List<Budget> _budgets = [];
  _addBudget(
    int idCategory,
    String description,
    double value,
  ) {
    final newBudget = Budget(
      id: Random().nextInt(999).toInt(),
      idCategory: idCategory,
      description: description,
      value: value,
    );

    setState(() {
      _budgets.add(newBudget);
    });

    Future.delayed(const Duration(milliseconds: 500), () {
      Navigator.of(context).pop();
    });
  }

  @override
  Widget build(BuildContext context) {
    const divider = Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.0),
      child: DividerContainer(),
    );

    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 70.0),
          child: SizedBox(
            width: 230,
            child: Image.asset(
              iLinearLogo,
              alignment: Alignment.center,
            ),
          ),
        ),
        const ListLabel(
          padding: EdgeInsets.symmetric(
            horizontal: 8.0,
            vertical: 30.0,
          ),
          label: "Cadastros",
        ),
        ProfileListCard(
          svgIcon: sBank,
          label: "Contas",
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const AccountScreen(),
              ),
            );
          },
        ),
        divider,
        ProfileListCard(
          svgIcon: sCards,
          label: "Cartões de crédito",
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const CreditCardScreen(),
              ),
            );
          },
        ),
        divider,
        ProfileListCard(
          svgIcon: sCategory,
          label: "Categorias personalizadas",
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const CategoryScreen(),
              ),
            );
          },
        ),
        divider,
        ProfileListCard(
          svgIcon: sAddBudget,
          label: "Novo orçamento",
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BudgetFormScreen(
                  onSubmit: _addBudget,
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
