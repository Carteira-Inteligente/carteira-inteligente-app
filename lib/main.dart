import 'dart:math';

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
import 'themes/light_theme.dart';
import 'widgets/AppBar/app_bar_add_button.dart';
import 'widgets/AppBar/app_bar_notification_button.dart';
import 'widgets/AppBar/app_bar_title.dart';
import 'widgets/Buttons/fast_entry_button.dart';

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

  _addEntry(
    int idUser,
    int idCategory,
    String description,
    String period,
    double paidValue,
    DateTime paidDate,
    bool paid,
    DateTime dueDate,
  ) {
    final newEntry = Entry(
      id: Random().nextInt(999).toInt(),
      idUser: idUser,
      idCategory: idCategory,
      description: description,
      period: period,
      paidValue: paidValue,
      paidDate: paidDate,
      paid: paid,
      dueDate: dueDate,
    );

    setState(() {
      _entries.add(newEntry);
    });

    Future.delayed(const Duration(milliseconds: 500), () {
      Navigator.of(context).pop();
    });
  }

  _addFastEntry(
    int idUser,
    String description,
    double paidValue,
  ) {
    final newFastEntry = Entry(
      id: Random().nextInt(999).toInt(),
      idUser: idUser,
      idCategory: 1,
      description: description,
      period: "Não repete",
      paidValue: paidValue,
      paidDate: DateTime.now(),
      paid: true,
      dueDate: DateTime.now(),
    );

    setState(() {
      _entries.add(newFastEntry);
    });

    Future.delayed(const Duration(milliseconds: 500), () {
      Navigator.of(context).pop();
    });
  }

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

  @override
  Widget build(BuildContext context) {
    _selectedIndex == 2 ? _selectedIndex = 1 : null;

    final sliverAppBar = SliverAppBar(
      title: Builder(
        builder: (context) {
          if (_selectedIndex == 0) {
            return const AppBarTitle(title: "Dashboard");
          } else if (_selectedIndex == 1) {
            return const AppBarTitle(title: "Lançamentos");
          } else if (_selectedIndex == 3) {
            return const AppBarTitle(title: "Orçamentos");
          } else if (_selectedIndex == 4) {
            return const AppBarTitle(title: "Perfil");
          } else {
            return Container();
          }
        },
      ),
      pinned: true,
      floating: true,
      forceElevated: true,
      backgroundColor: cBlue.shade700,
      actions: <Widget>[
        Builder(
          builder: (context) {
            if (_selectedIndex == 1) {
              return AppBarAddButton(
                tooltip: "Novo lançamento",
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          EntryFormScreen(onSubmit: _addEntry),
                    ),
                  );
                },
              );
            } else if (_selectedIndex == 3) {
              return AppBarAddButton(
                tooltip: "Novo orçamento",
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          BudgetFormScreen(onSubmit: _addBudget),
                    ),
                  );
                },
              );
            } else if (_selectedIndex == 4) {
              return const AppBarNotificationButton();
            } else {
              return Container();
            }
          },
        ),
      ],
    );

    final bottomNavigationBar = CupertinoTabBar(
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
      backgroundColor: cWhite,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            sDashboard,
            color: _selectedIndex == 0 ? cBlue.shade800 : cGrey,
          ),
          label: _selectedIndex == 0 ? "Dashboard" : null,
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            sWallet,
            color: _selectedIndex == 1 ? cBlue.shade800 : cGrey,
          ),
          label: _selectedIndex == 1 ? "Lançamentos" : null,
        ),
        BottomNavigationBarItem(
          icon: FastEntryButton(
            fastEntryScreen: FastEntryScreen(onSubmit: _addFastEntry),
          ),
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            sBudget,
            color: _selectedIndex == 3 ? cBlue.shade800 : cGrey,
          ),
          label: _selectedIndex == 3 ? "Orçamentos" : null,
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            sUser,
            color: _selectedIndex == 4 ? cBlue.shade800 : cGrey,
          ),
          label: _selectedIndex == 4 ? "Perfil" : null,
        ),
      ],
    );

    return Scaffold(
      backgroundColor: cWhite,
      body: CustomScrollView(
        slivers: <Widget>[
          sliverAppBar,
          SliverList(
            delegate: SliverChildListDelegate(
              <Widget>[
                _navBarOptions.elementAt(_selectedIndex),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: bottomNavigationBar,
    );
  }
}
