import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../constants/svgs.dart';
import '../../models/budget.dart';
import '../../models/users.dart';
import '../../services/budget_service.dart';
import '../../services/user_service.dart';
import '../../utils/show_dialog.dart';
import '../../widgets/Buttons/primary_buttons.dart';
import '../../widgets/Cards/list_cards.dart';
import '../../widgets/Containers/card_container.dart';
import '../../widgets/Containers/divider_container.dart';
import '../../widgets/Containers/progress_containers.dart';
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

class MoreScreen extends StatefulWidget {
  const MoreScreen({super.key});

  @override
  State<MoreScreen> createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen> {
  final List<Budget> _budgets = [];
  List<Users> _users = [];
  bool _isLoading = false;

  Future<List<Users>> _fetchUsers() async {
    setState(() {
      _isLoading = true;
    });

    final users = await UsersService.findAll("Contas");

    setState(() {
      _isLoading = false;
      _users = users;
    });

    return users;
  }

  _updateUser(Users user, String name, String email, String password) async {
    final updatedUser = await UsersService.put(
      context,
      user,
      name,
      email,
      password,
    );

    final index = _users.indexWhere(
      (user) => user.id == updatedUser.id,
    );

    if (index != -1) {
      setState(() {
        _users[index] = updatedUser;
      });
    }
  }

  _deleteUser(int id) async {
    await UsersService.delete(context, _users.last, id);
  }

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
  void initState() {
    super.initState();
    _fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    const divider = Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.0),
      child: DividerContainer(),
    );

    return Column(
      children: <Widget>[
        _isLoading
            ? ProgressIndicatorContainer(visible: _isLoading)
            : RefreshIndicator(
                onRefresh: _fetchUsers,
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 15.0),
                      child: RoundedIconContainer(
                        pathIcon: sUser,
                        backgroundColor: cGrey.shade200,
                        radius: 45,
                        heigth: 45,
                      ),
                    ),
                    SubtitleLabel(label: _users.last.name),
                    ModalTitleLabel(label: _users.last.email),
                    SmallPrimaryButton(
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EditUserFormScreen(
                            user: _users.last,
                            onSubmit: (name, email, password) => _updateUser(
                              _users.last,
                              name,
                              email,
                              password,
                            ),
                          ),
                        ),
                      ),
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
                                MoreListCard(
                                  svgIcon: sBank,
                                  label: "Contas",
                                  subtitle: "Gerencie suas contas bancárias",
                                  onTap: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const AccountScreen(),
                                    ),
                                  ),
                                ),
                                divider,
                                MoreListCard(
                                  svgIcon: sCards,
                                  label: "Cartões de crédito",
                                  subtitle: "Gerencie seus cartões de crédito",
                                  onTap: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const CreditCardScreen(),
                                    ),
                                  ),
                                ),
                                divider,
                                MoreListCard(
                                  svgIcon: sCategory,
                                  label: "Categorias personalizadas",
                                  subtitle:
                                      "Crie e edite suas categorias personalizadas",
                                  onTap: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const CategoryScreen(),
                                    ),
                                  ),
                                ),
                                divider,
                                MoreListCard(
                                  svgIcon: sAddBudget,
                                  label: "Novo orçamento",
                                  subtitle:
                                      "Crie orçamentos para organizar suas despesas",
                                  onTap: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => BudgetFormScreen(
                                        onSubmit: _createBudget,
                                      ),
                                    ),
                                  ),
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
                                OtherListCard(
                                  svgIcon: sLogout,
                                  label: "Sair do aplicativo",
                                  onTap: () => ShowDialog.logoutDialog(
                                    context,
                                    () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const InitialScreen(),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                divider,
                                OtherListCard(
                                  svgIcon: sDelete,
                                  label: "Excluir usuário",
                                  onTap: () => ShowDialog.deleteDialog(
                                    context,
                                    "usuário",
                                    () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const InitialScreen(),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
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
