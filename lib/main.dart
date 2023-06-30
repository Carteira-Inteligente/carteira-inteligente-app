import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'constants/colors.dart';
import 'constants/svgs.dart';
import 'models/budget.dart';
import 'models/entry.dart';
import 'screens/Budget/budget_form_screen.dart';
import 'screens/Budget/budget_screen.dart';
import 'screens/Dashboard/dashboard_screen.dart';
import 'screens/Entry/entry_form_screen.dart';
import 'screens/Entry/entry_screen.dart';
import 'screens/Entry/fast_entry_screen.dart';
import 'screens/Profile/profile_screen.dart';
import 'services/budget_service.dart';
import 'services/entry_service.dart';
import 'themes/light_theme.dart';
import 'widgets/AppBar/app_bar_buttons.dart';
import 'widgets/AppBar/app_bar_image.dart';
import 'widgets/AppBar/app_bar_title.dart';
import 'widgets/Buttons/primary_buttons.dart';
import 'widgets/Containers/rounded_icon_container.dart';

void main() {
  runApp(const CarteiraInteligenteApp());
}

class CarteiraInteligenteApp extends StatelessWidget {
  const CarteiraInteligenteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const LightTheme();
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  final List<Entry> _entries = [];
  final List<Budget> _budgets = [];

  static const List<Widget> _navBarOptions = <Widget>[
    DashboardScreen(),
    EntryScreen(),
    Placeholder(),
    BudgetScreen(),
    ProfileScreen(),
  ];

  _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  _createEntry(
    bool paid,
    String description,
    int idCategory,
    String period,
    int idPaymentType,
    double paidValue,
    DateTime dueDate,
    DateTime paidDate,
  ) async {
    final createdEntry = await EntryService.post(
      context,
      paid,
      description,
      idCategory,
      period,
      idPaymentType,
      paidValue,
      dueDate,
      paidDate,
    );

    setState(() {
      _entries.add(createdEntry);
    });
  }

  _createFastEntry(String description, double paidValue) async {
    final createdEntry = await EntryService.postFast(
      context,
      description,
      paidValue,
    );

    setState(() {
      _entries.add(createdEntry);
    });
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
  Widget build(BuildContext context) {
    _selectedIndex == 2 ? _selectedIndex = 1 : null;

    return Scaffold(
      backgroundColor: cWhite,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            title: Builder(
              builder: (context) {
                if (_selectedIndex == 0) {
                  return const AppBarTitle(title: "Dashboard");
                } else if (_selectedIndex == 1) {
                  return const AppBarTitle(title: "Lançamentos");
                } else if (_selectedIndex == 3) {
                  return const AppBarTitle(title: "Orçamentos");
                } else if (_selectedIndex == 4) {
                  return const AppBarImage();
                } else {
                  return Container();
                }
              },
            ),
            pinned: true,
            floating: true,
            forceElevated: true,
            backgroundColor: cBlue.shade800,
            actions: <Widget>[
              Builder(
                builder: (context) {
                  if (_selectedIndex == 1) {
                    return Row(
                      children: <Widget>[
                        const AppBarFilterButton(),
                        AppBarAddButton(
                          tooltip: "Novo lançamento",
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    EntryFormScreen(onSubmit: _createEntry),
                              ),
                            );
                          },
                        ),
                      ],
                    );
                  } else if (_selectedIndex == 3) {
                    return Row(
                      children: <Widget>[
                        const AppBarFilterButton(),
                        AppBarAddButton(
                          tooltip: "Novo orçamento",
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    BudgetFormScreen(onSubmit: _createBudget),
                              ),
                            );
                          },
                        ),
                      ],
                    );
                  } else if (_selectedIndex == 4) {
                    return const AppBarNotificationButton(
                      tooltip: "Notificações",
                    );
                  } else {
                    return Container();
                  }
                },
              ),
            ],
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              <Widget>[
                _navBarOptions.elementAt(_selectedIndex),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: CupertinoTabBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        backgroundColor: cWhite,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              sDashboard,
              color: _selectedIndex == 0 ? cBlue.shade800 : cGrey,
            ),
            label: "Dashboard",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              sWallet,
              color: _selectedIndex == 1 ? cBlue.shade800 : cGrey,
            ),
            label: "Lançamentos",
          ),
          BottomNavigationBarItem(
            icon: FastEntryButton(
              screen: FastEntryScreen(onSubmit: _createFastEntry),
            ),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              sBudget,
              color: _selectedIndex == 3 ? cBlue.shade800 : cGrey,
            ),
            label: "Orçamentos",
          ),
          BottomNavigationBarItem(
            icon: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                border: Border.all(
                  width: _selectedIndex == 4 ? 1.5 : 0,
                  color: _selectedIndex == 4 ? cBlue.shade800 : cGrey.shade200,
                ),
              ),
              child: RoundedIconContainer(
                pathIcon: sUser,
                backgroundColor: cGrey.shade200,
                radius: 12,
                heigth: 12,
              ),
            ),
            label: "Perfil",
          ),
        ],
      ),
    );
  }
}
