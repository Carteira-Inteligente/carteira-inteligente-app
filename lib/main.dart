import 'dart:math';

import 'package:carteira_inteligente/constants/constants.dart';
import 'package:carteira_inteligente/models/budget.dart';
import 'package:carteira_inteligente/models/entries.dart';
import 'package:carteira_inteligente/screens/Budget/budget_form_screen.dart';
import 'package:carteira_inteligente/screens/Budget/budget_screen.dart';
import 'package:carteira_inteligente/screens/Dashboard/dashboard_screen.dart';
import 'package:carteira_inteligente/screens/Entry/entry_form_screen.dart';
import 'package:carteira_inteligente/screens/Entry/entry_screen.dart';
import 'package:carteira_inteligente/screens/Profile/profile_screen.dart';
import 'package:carteira_inteligente/themes/light_theme.dart';
import 'package:carteira_inteligente/widgets/AppBar/app_bar_filter_button.dart';
import 'package:carteira_inteligente/widgets/AppBar/app_bar_title.dart';
import 'package:carteira_inteligente/widgets/AppBar/app_bar_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';

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
    BudgetScreen(),
    ProfileScreen(),
  ];

  int _selectedIndex = 0;

  _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Entries> _entries = [];
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
    final newEntry = Entries(
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
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            shape: const ContinuousRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(20),
              ),
            ),
            title: Builder(
              builder: (context) {
                if (_selectedIndex == 0) {
                  return const AppBarTitle("Dashboard");
                } else if (_selectedIndex == 1) {
                  return const AppBarTitle("Lançamentos");
                } else if (_selectedIndex == 2) {
                  return const AppBarTitle("Orçamentos");
                } else {
                  return const AppBarTitle("Perfil");
                }
              },
            ),
            pinned: true,
            floating: true,
            forceElevated: true,
            backgroundColor: Theme.of(context).primaryColor,
            actions: _selectedIndex != 0 && _selectedIndex != 3
                ? <Widget>[
                    const AppBarButton(),
                    const AppBarFilterButton(),
                  ]
                : <Widget>[
                    const AppBarButton(),
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
        backgroundColor: Colors.white,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              sDashboard,
              color:
                  _selectedIndex == 0 ? Theme.of(context).primaryColor : cGrey,
            ),
          ),
          BottomNavigationBarItem(
            icon: _selectedIndex != 0 && _selectedIndex != 3
                ? Padding(
                    padding: const EdgeInsets.only(right: 35.0),
                    child: SvgPicture.asset(
                      sWallet,
                      color: _selectedIndex == 1
                          ? Theme.of(context).primaryColor
                          : cGrey,
                    ),
                  )
                : SvgPicture.asset(
                    sWallet,
                    color: _selectedIndex == 1
                        ? Theme.of(context).primaryColor
                        : cGrey,
                  ),
          ),
          BottomNavigationBarItem(
            icon: _selectedIndex != 0 && _selectedIndex != 3
                ? Padding(
                    padding: const EdgeInsets.only(left: 35.0),
                    child: SvgPicture.asset(
                      sBudget,
                      color: _selectedIndex == 2
                          ? Theme.of(context).primaryColor
                          : cGrey,
                    ),
                  )
                : SvgPicture.asset(
                    sBudget,
                    color: _selectedIndex == 2
                        ? Theme.of(context).primaryColor
                        : cGrey,
                  ),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              sUser,
              color:
                  _selectedIndex == 3 ? Theme.of(context).primaryColor : cGrey,
            ),
          ),
        ],
      ),
      floatingActionButton: _selectedIndex != 0 && _selectedIndex != 3
          ? FloatingActionButton(
              elevation: 0,
              mini: true,
              backgroundColor: Theme.of(context).primaryColor,
              onPressed: _selectedIndex == 1
                  ? () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EntryFormScreen(_addEntry),
                        ),
                      );
                    }
                  : () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BudgetFormScreen(_addBudget),
                        ),
                      );
                    },
              child: SvgPicture.asset(
                sAdd,
                color: cWhite,
              ),
            )
          : null,
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
    );
  }
}
