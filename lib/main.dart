import 'package:carteira_inteligente_app/constants/constants.dart';
import 'package:carteira_inteligente_app/screens/Budget/budget_screen.dart';
import 'package:carteira_inteligente_app/screens/Home/home_screen.dart';
import 'package:carteira_inteligente_app/screens/Lancamentos/lancamentos_screen.dart';
import 'package:carteira_inteligente_app/screens/Profile/profile_screen.dart';
import 'package:carteira_inteligente_app/themes/light_theme.dart';
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
    HomeScreen(),
    LancamentosScreen(),
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
            title: Text("Carteira Inteligente"),
            pinned: true,
            floating: true,
            // flexibleSpace: Placeholder(),
            expandedHeight: 100,
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              _navBarOptions.elementAt(_selectedIndex),
            ]),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(sHome),
            label: "Início",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(sMoneySend),
            label: 'Lançamentos',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(sDollarCircle),
            label: 'Orçamento',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(sUser),
            label: 'Perfil',
          ),
        ],
        currentIndex: _selectedIndex,
        showUnselectedLabels: true,
        unselectedItemColor: cGrey,
        selectedItemColor: cBlack,
        onTap: _onItemTapped,
      ),
    );
  }
}
