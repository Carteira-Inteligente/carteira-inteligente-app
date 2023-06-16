import 'package:flutter/material.dart';

import '../../constants/images.dart';
import '../../constants/svgs.dart';
import '../../models/budget.dart';
import '../../services/budget_service.dart';
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
  List<Budget> _budgets = [];

  _createBudget(int categoryId, String description, double value) async {
    final createdBudget = await BudgetService.post(
      context,
      categoryId,
      description,
      value,
    );

    setState(() {
      _budgets.add(createdBudget);
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
                  onSubmit: _createBudget,
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
