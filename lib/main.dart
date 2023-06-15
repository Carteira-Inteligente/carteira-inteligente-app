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
import 'screens/Drawer/drawer_screen.dart';
import 'screens/Entry/entry_form_screen.dart';
import 'screens/Entry/entry_screen.dart';
import 'screens/Entry/fast_entry_screen.dart';
import 'services/budget_service.dart';
import 'themes/light_theme.dart';
import 'widgets/AppBar/app_bar_buttons.dart';
import 'widgets/AppBar/app_bar_leading.dart';
import 'widgets/AppBar/app_bar_title.dart';
import 'widgets/Buttons/primary_buttons.dart';

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
  bool _isLoading = false;
  List<Entry> _entries = [];
  List<Budget> _budgets = [];

  static const List<Widget> _navBarOptions = <Widget>[
    EntryScreen(),
    Placeholder(),
    BudgetScreen(),
  ];

  _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  _addEntry(
    bool paid,
    String description,
    int idCategory,
    int idRecurrence,
    int idPaymentType,
    double paidValue,
    DateTime dueDate,
  ) {
    final newEntry = Entry(
      id: Random().nextInt(999).toInt(),
      idCategory: idCategory,
      description: description,
      idRecurrence: idRecurrence,
      idPaymentType: idPaymentType,
      paidValue: paidValue,
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
      paid: true,
      description: description,
      idCategory: 1,
      idRecurrence: 1,
      idPaymentType: 1,
      paidValue: paidValue,
      dueDate: DateTime.now(),
    );

    setState(() {
      _entries.add(newFastEntry);
    });

    Future.delayed(const Duration(milliseconds: 500), () {
      Navigator.of(context).pop();
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
    _selectedIndex == 1 ? _selectedIndex = 0 : null;

    final sliverAppBar = SliverAppBar(
      title: Builder(
        builder: (context) {
          if (_selectedIndex == 0) {
            return const AppBarTitle(title: "Lançamentos");
          } else if (_selectedIndex == 2) {
            return const AppBarTitle(title: "Orçamentos");
          } else {
            return Container();
          }
        },
      ),
      pinned: true,
      floating: true,
      forceElevated: true,
      backgroundColor: cBlue.shade700,
      leading: const AppBarLeadingDrawer(),
      actions: <Widget>[
        Builder(
          builder: (context) {
            if (_selectedIndex == 0) {
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
            } else if (_selectedIndex == 2) {
              return AppBarAddButton(
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
              );
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
            sWallet,
            color: _selectedIndex == 0 ? cBlue.shade800 : cGrey,
          ),
          label: _selectedIndex == 0 ? "Lançamentos" : null,
        ),
        BottomNavigationBarItem(
          icon: FastEntryButton(
            screen: FastEntryScreen(onSubmit: _addFastEntry),
          ),
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            sBudget,
            color: _selectedIndex == 2 ? cBlue.shade800 : cGrey,
          ),
          label: _selectedIndex == 2 ? "Orçamentos" : null,
        ),
      ],
    );

    return Scaffold(
      backgroundColor: cWhite,
      drawer: const Drawer(
        backgroundColor: cWhite,
        child: DrawerScreen(),
      ),
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
