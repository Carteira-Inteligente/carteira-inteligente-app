import 'dart:math';

import 'package:carteira_inteligente/constants/constants.dart';
import 'package:carteira_inteligente/models/entries.dart';
import 'package:carteira_inteligente/screens/Budget/budget_screen.dart';
import 'package:carteira_inteligente/screens/Dashboard/dashboard_screen.dart';
import 'package:carteira_inteligente/screens/Entry/entry_form_screen.dart';
import 'package:carteira_inteligente/screens/Entry/entry_screen.dart';
import 'package:carteira_inteligente/screens/Profile/profile_screen.dart';
import 'package:carteira_inteligente/themes/light_theme.dart';
import 'package:carteira_inteligente/widgets/AppBar/app_bar_logo.dart';
import 'package:carteira_inteligente/widgets/AppBar/app_bar_title.dart';
import 'package:carteira_inteligente/widgets/AppBar/app_bar_button.dart';
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
            title:
                _selectedIndex == 3 ? const AppBarTitle() : const AppBarLogo(),
            pinned: true,
            floating: true,
            forceElevated: true,
            backgroundColor: Theme.of(context).primaryColor,
            actions: const <Widget>[
              AppBarButton(),
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
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              sDashboard,
              color:
                  _selectedIndex == 0 ? Theme.of(context).primaryColor : cGrey,
            ),
            label: "Dashboard",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              sWallet,
              color:
                  _selectedIndex == 1 ? Theme.of(context).primaryColor : cGrey,
            ),
            label: "Lançamentos",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              sBudget,
              color:
                  _selectedIndex == 2 ? Theme.of(context).primaryColor : cGrey,
            ),
            tooltip: "Orçamento",
            label: "Orçamento",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              sUser,
              color:
                  _selectedIndex == 3 ? Theme.of(context).primaryColor : cGrey,
            ),
            label: "Perfil",
          ),
        ],
        currentIndex: _selectedIndex,

        showUnselectedLabels: false,
        showSelectedLabels: false,
        // unselectedItemColor: cWhite,
        selectedItemColor: Theme.of(context).primaryColor,
        onTap: _onItemTapped,
        backgroundColor: cWhite,
      ),
      floatingActionButton: _selectedIndex != 3
          ? FloatingActionButton(
              backgroundColor: Theme.of(context).primaryColor,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EntryFormScreen(_addEntry),
                  ),
                );
              },
              child: SvgPicture.asset(
                sAdd,
                color: cWhite,
              ),
            )
          : null,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
