import 'dart:math';

import 'package:flutter/material.dart';

import '../../constants/colors.dart';
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
          padding: const EdgeInsets.only(top: 15.0),
          child: RoundedIconContainer(
            svgPicture: sUser,
            backgroundColor: cGrey.shade200,
            radius: 45,
            heigth: 45,
          ),
        ),
        const SubtitleLabel(label: "Thiago Martins Proença"),
        const ModalTitleLabel(label: "thiagoenca@gmail.com"),
        SmallPrimaryButton(
          onPressed: () {
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: (context) => EditUserFormScreen(onSubmit: _addUser),
            //   ),
            // );
          },
          backgroundColor: cBlue.shade800,
          label: "Editar usuário",
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          child: DividerContainer(),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.54,
          child: ListView(
            children: <Widget>[
              CardContainer(
                child: Column(
                  children: <Widget>[
                    const ListLabel(
                      padding: EdgeInsets.all(8.0),
                      label: "Configurações",
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
                ),
              ),
              CardContainer(
                child: Column(
                  children: <Widget>[
                    const ListLabel(
                      padding: EdgeInsets.all(8.0),
                      label: "Outros",
                    ),
                    ProfileListCard(
                      svgIcon: sLogout,
                      label: "Sair do aplicativo",
                      onTap: () {
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
                    ProfileListCard(
                      svgIcon: sDelete,
                      label: "Excluir usuário",
                      onTap: () {
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
