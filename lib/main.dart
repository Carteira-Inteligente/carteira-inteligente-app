import 'package:carteira_inteligente_app/constants/constants.dart';
import 'package:carteira_inteligente_app/screens/Budget/budget_screen.dart';
import 'package:carteira_inteligente_app/screens/Dashboard/dashboard_screen.dart';
import 'package:carteira_inteligente_app/screens/Entry/entry_screen.dart';
import 'package:carteira_inteligente_app/screens/Profile/profile_screen.dart';
import 'package:carteira_inteligente_app/themes/light_theme.dart';
import 'package:carteira_inteligente_app/widgets/AppBar/title_app_bar.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            shape: ContinuousRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(20),
              ),
            ),
            title: TitleAppBar(),
            pinned: true,
            floating: true,
            forceElevated: true,
            backgroundColor: cWhite,
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
            backgroundColor: cWhite,
            icon: SvgPicture.asset(
              sDashboard,
              color: _selectedIndex == 0 ? cBlue : cGrey,
            ),
            label: "Dashboard",
          ),
          BottomNavigationBarItem(
            backgroundColor: cWhite,
            icon: SvgPicture.asset(
              sWallet,
              color: _selectedIndex == 1 ? cBlue : cGrey,
            ),
            label: 'Lançamentos',
          ),
          BottomNavigationBarItem(
            backgroundColor: cWhite,
            icon: SvgPicture.asset(
              sDollarCircle,
              color: _selectedIndex == 2 ? cBlue : cGrey,
            ),
            label: 'Orçamento',
          ),
          BottomNavigationBarItem(
            backgroundColor: cWhite,
            icon: SvgPicture.asset(
              sUser,
              color: _selectedIndex == 3 ? cBlue : cGrey,
            ),
            label: 'Perfil',
          ),
        ],
        currentIndex: _selectedIndex,
        showUnselectedLabels: true,
        unselectedItemColor: cGrey,
        selectedItemColor: cBlue,
        onTap: _onItemTapped,
      ),
    );
  }
}
