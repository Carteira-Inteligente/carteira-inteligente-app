import 'dart:math';
import 'dart:ui';

import 'package:carteira_inteligente_app/constants/constants.dart';
import 'package:carteira_inteligente_app/models/entries.dart';
import 'package:carteira_inteligente_app/screens/Budget/budget_screen.dart';
import 'package:carteira_inteligente_app/screens/Dashboard/dashboard_screen.dart';
import 'package:carteira_inteligente_app/screens/Entry/entry_form_screen.dart';
import 'package:carteira_inteligente_app/screens/Entry/entry_screen.dart';
import 'package:carteira_inteligente_app/screens/Profile/profile_screen.dart';
import 'package:carteira_inteligente_app/themes/light_theme.dart';
import 'package:carteira_inteligente_app/widgets/AppBar/app_bar_logo.dart';
import 'package:carteira_inteligente_app/widgets/AppBar/app_bar_title.dart';
import 'package:carteira_inteligente_app/widgets/AppBar/app_bar_button.dart';
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
            backgroundColor: cWhite,
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
              color: _selectedIndex == 0 ? cBlue : cGrey,
            ),
            label: "Dashboard",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              sWallet,
              color: _selectedIndex == 1 ? cBlue : cGrey,
            ),
            label: "Lançamentos",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              sDollarCircle,
              color: _selectedIndex == 2 ? cBlue : cGrey,
            ),
            label: "Orçamento",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              sUser,
              color: _selectedIndex == 3 ? cBlue : cGrey,
            ),
            label: "Perfil",
          ),
        ],
        currentIndex: _selectedIndex,
        showUnselectedLabels: true,
        unselectedItemColor: cGrey,
        selectedItemColor: cBlue,
        onTap: _onItemTapped,
        backgroundColor: cWhite,
      ),
      floatingActionButton: _selectedIndex == 1 || _selectedIndex == 2
          ? FloatingActionButton(
              backgroundColor: cBlue,
              onPressed: _selectedIndex == 1
                  ? () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EntryFormScreen(_addEntry),
                        ),
                      );
                    }
                  : () {},
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
