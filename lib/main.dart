import 'dart:math';

import 'package:carteira_inteligente/constants/colors.dart';
import 'package:carteira_inteligente/constants/svgs.dart';
import 'package:carteira_inteligente/models/basic_entries.dart';
import 'package:carteira_inteligente/models/budget.dart';
import 'package:carteira_inteligente/models/entry.dart';
import 'package:carteira_inteligente/screens/Budget/budget_form_screen.dart';
import 'package:carteira_inteligente/screens/Budget/budget_screen.dart';
import 'package:carteira_inteligente/screens/Dashboard/dashboard_screen.dart';
import 'package:carteira_inteligente/screens/Entry/fast_entry_screen.dart';
import 'package:carteira_inteligente/screens/Entry/entry_screen.dart';
import 'package:carteira_inteligente/screens/Profile/profile_screen.dart';
import 'package:carteira_inteligente/themes/light_theme.dart';
import 'package:carteira_inteligente/widgets/AppBar/app_bar_filter_button.dart';
import 'package:carteira_inteligente/widgets/AppBar/app_bar_notification_button.dart';
import 'package:carteira_inteligente/widgets/AppBar/app_bar_title.dart';
import 'package:carteira_inteligente/widgets/AppBar/app_bar_add_button.dart';
import 'package:carteira_inteligente/widgets/Buttons/fast_entry_button.dart';
import 'package:carteira_inteligente/widgets/Inputs/input_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';

import 'screens/Entry/entry_form_screen.dart';

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
  static const List<Widget> _navBarOptions = <Widget>[
    DashboardScreen(),
    EntryScreen(),
    Placeholder(),
    BudgetScreen(),
    ProfileScreen(),
  ];

  int _selectedIndex = 0;

  _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Entry> _entries = [];
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

  final List<BasicEntries> _basicEntries = [];
  _addBasicEntry(
    int idUser,
    String description,
    double paidValue,
  ) {
    final newBasicEntry = BasicEntries(
      id: Random().nextInt(999).toInt(),
      idUser: idUser,
      description: description,
      paidValue: paidValue,
    );

    setState(() {
      _basicEntries.add(newBasicEntry);
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

  @override
  Widget build(BuildContext context) {
    _selectedIndex == 2 ? _selectedIndex = 1 : null;

    final sliverAppBar = SliverAppBar(
      title: Builder(
        builder: (context) {
          if (_selectedIndex == 0) {
            return const AppBarTitle("Dashboard");
          } else if (_selectedIndex == 1) {
            return const AppBarTitle("Lançamentos");
          } else if (_selectedIndex == 3) {
            return const AppBarTitle("Orçamentos");
          } else if (_selectedIndex == 4) {
            return const AppBarTitle("Perfil");
          } else {
            return Container();
          }
        },
      ),
      flexibleSpace: _selectedIndex == 1 || _selectedIndex == 3
          ? Container(
              padding: const EdgeInsets.only(top: 105),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                child: InputSearch(),
              ),
            )
          : null,
      expandedHeight: _selectedIndex == 1 || _selectedIndex == 3 ? 130 : 0,
      pinned: true,
      floating: true,
      forceElevated: true,
      backgroundColor: Theme.of(context).primaryColor,
      actions: <Widget>[
        Builder(
          builder: (context) {
            if (_selectedIndex == 1) {
              return Row(
                children: <Widget>[
                  const AppBarFilterButton(),
                  AppBarAddButton(
                    "Novo lançamento",
                    () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EntryFormScreen(_addEntry),
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
            color: _selectedIndex == 0 ? Theme.of(context).primaryColor : cGrey,
          ),
          label: _selectedIndex == 0 ? "Dashboard" : null,
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            sWallet,
            color: _selectedIndex == 1 ? Theme.of(context).primaryColor : cGrey,
          ),
          label: _selectedIndex == 1 ? "Lançamentos" : null,
        ),
        BottomNavigationBarItem(
          icon: FastEntryButton(FastEntryScreen(_addBasicEntry)),
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            sBudget,
            color: _selectedIndex == 3 ? Theme.of(context).primaryColor : cGrey,
          ),
          label: _selectedIndex == 3 ? "Orçamentos" : null,
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            sUser,
            color: _selectedIndex == 4 ? Theme.of(context).primaryColor : cGrey,
          ),
          label: _selectedIndex == 4 ? "Perfil" : null,
        ),
      ],
    );

    final height = MediaQuery.of(context).size.height -
        sliverAppBar.toolbarHeight -
        bottomNavigationBar.height;

    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          sliverAppBar,
          SliverList(
            delegate: SliverChildListDelegate(
              <Widget>[
                SizedBox(
                  height: height,
                  child: _navBarOptions.elementAt(_selectedIndex),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: bottomNavigationBar,
    );
  }
}
