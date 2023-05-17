import 'dart:math';

import 'package:carteira_inteligente/constants/colors.dart';
import 'package:carteira_inteligente/constants/svgs.dart';
import 'package:carteira_inteligente/models/budget.dart';
import 'package:carteira_inteligente/models/users.dart';
import 'package:carteira_inteligente/screens/Budget/budget_form_screen.dart';
import 'package:carteira_inteligente/screens/Category/category_screen.dart';
import 'package:carteira_inteligente/screens/Initial/initial_screen.dart';
import 'package:carteira_inteligente/screens/PaymentType/account_screen.dart';
import 'package:carteira_inteligente/screens/PaymentType/credit_card_screen.dart';
import 'package:carteira_inteligente/screens/User/edit_user_form_screen.dart';
import 'package:carteira_inteligente/utils/show_dialog.dart';
import 'package:carteira_inteligente/widgets/Buttons/dialog_action_button.dart';
import 'package:carteira_inteligente/widgets/Cards/list_card.dart';
import 'package:carteira_inteligente/widgets/Containers/card_container.dart';
import 'package:carteira_inteligente/widgets/Containers/divider_container.dart';
import 'package:carteira_inteligente/widgets/Containers/rounded_icon_container.dart';
import 'package:carteira_inteligente/widgets/Labels/list_label.dart';
import 'package:carteira_inteligente/widgets/Labels/modal_title_label.dart';
import 'package:carteira_inteligente/widgets/Labels/subtitle_label.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final List<Users> _users = [];
  _addUser(String name, String email, String password) {
    final newUser = Users(
      id: Random().nextInt(999).toInt(),
      name: name,
      email: email,
      password: password,
    );

    setState(() {
      _users.add(newUser);
    });

    Future.delayed(const Duration(milliseconds: 500), () {
      Navigator.of(context).pop();
    });
  }

  final List<Budget> _budgets = [];
  _addBudget(
    int idUser,
    int idCategory,
    double value,
  ) {
    final newBudget = Budget(
      id: Random().nextInt(999).toInt(),
      idUser: idUser,
      idCategory: idCategory,
      value: value,
    );

    setState(() {
      _budgets.add(newBudget);
    });

    Future.delayed(const Duration(milliseconds: 500), () {
      Navigator.of(context).pop();
    });
  }

  final divider = Padding(
    padding: const EdgeInsets.symmetric(horizontal: 15.0),
    child: Divider(color: cGrey.shade400),
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 15.0),
          child: RoundedIconContainer(
            sUser,
            cGrey.shade200,
            45,
          ),
        ),
        const SubtitleLabel("Thiago Martins Proença"),
        const ModalTitleLabel("thiagoenca@gmail.com"),
        DialogActionButton(
          () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => EditUserFormScreen(_addUser),
              ),
            );
          },
          cBlue,
          "Editar usuário",
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          child: DividerContainer(),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.53,
          child: ListView(
            children: <Widget>[
              CardContainer(
                Column(
                  children: <Widget>[
                    const ListLabel("Configurações"),
                    ListCard(
                      sBank,
                      "Contas",
                      () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const AccountScreen(),
                          ),
                        );
                      },
                    ),
                    divider,
                    ListCard(
                      sCards,
                      "Cartões de crédito",
                      () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const CreditCardScreen(),
                          ),
                        );
                      },
                    ),
                    divider,
                    ListCard(
                      sCategory,
                      "Categorias personalizadas",
                      () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const CategoryScreen(),
                          ),
                        );
                      },
                    ),
                    divider,
                    ListCard(
                      sAddBudget,
                      "Novo orçamento",
                      () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BudgetFormScreen(_addBudget),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              CardContainer(
                Column(
                  children: <Widget>[
                    const ListLabel("Outros"),
                    ListCard(
                      sLogout,
                      "Sair do aplicativo",
                      () {
                        ShowDialog.logoutDialog(
                          context,
                          () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const InitialScreen(),
                              ),
                            );
                          },
                        );
                      },
                    ),
                    divider,
                    ListCard(
                      sDelete,
                      "Excluir conta",
                      () {
                        ShowDialog.deleteDialog(
                          context,
                          "usuário",
                          () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const InitialScreen(),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
