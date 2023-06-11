import 'dart:math';

import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../constants/images.dart';
import '../../constants/svgs.dart';
import '../../models/budget.dart';
import '../../models/users.dart';
import '../../utils/show_dialog.dart';
import '../../widgets/Buttons/primary_buttons.dart';
import '../../widgets/Cards/list_cards.dart';
import '../../widgets/Containers/card_container.dart';
import '../../widgets/Containers/divider_container.dart';
import '../../widgets/Containers/rounded_icon_container.dart';
import '../../widgets/Labels/list_label.dart';
import '../../widgets/Labels/modal_title_label.dart';
import '../../widgets/Labels/subtitle_label.dart';
import '../Budget/budget_form_screen.dart';
import '../Category/category_screen.dart';
import '../Initial/initial_screen.dart';
import '../PaymentType/account_screen.dart';
import '../PaymentType/credit_card_screen.dart';
import '../User/edit_user_form_screen.dart';

class DrawerScreen extends StatefulWidget {
  const DrawerScreen({super.key});

  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  final List<Budget> _budgets = [];
  _addBudget(
    int idUser,
    int idCategory,
    double value,
    double availableValue,
  ) {
    final newBudget = Budget(
      id: Random().nextInt(999).toInt(),
      idUser: idUser,
      idCategory: idCategory,
      value: value,
      availableValue: availableValue,
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
          padding: EdgeInsets.only(left: 8.0, top: 30.0),
          label: "Cadastros",
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.7,
          child: ListView(
            children: <Widget>[
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
          ),
        ),
      ],
    );
  }
}
