import 'dart:math';

import 'package:carteira_inteligente_app/constants/constants.dart';
import 'package:carteira_inteligente_app/screens/Entry/create_entry_screen.dart';
import 'package:carteira_inteligente_app/screens/Entry/show_entry_screen.dart';
import 'package:carteira_inteligente_app/themes/dark_status_bar_theme.dart';
import 'package:carteira_inteligente_app/utils/format_currency.dart';
import 'package:carteira_inteligente_app/widgets/Buttons/filter_button.dart';
import 'package:carteira_inteligente_app/widgets/Cards/list_tile_card.dart';
import 'package:carteira_inteligente_app/widgets/Inputs/input_search.dart';
import 'package:carteira_inteligente_app/widgets/Labels/title_label.dart';
import 'package:carteira_inteligente_app/models/entries.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

class EntryScreen extends StatefulWidget {
  const EntryScreen({super.key});

  @override
  State<EntryScreen> createState() => _LancamentosScreenState();
}

class _LancamentosScreenState extends State<EntryScreen> {
  var formatCurrency = getFormatCurrency();

  final List<Entries> _entries = [
    Entries(
      id: 1,
      idUser: 1,
      idCategory: 1,
      description: "Conta de luz",
      period: "Mensal",
      paidValue: 123.45,
      paidDate: DateTime.now(),
      paid: true,
      dueDate: DateTime.now(),
    ),
    Entries(
      id: 2,
      idUser: 1,
      idCategory: 2,
      description: "IPTU",
      period: "Anual",
      paidValue: 542.33,
      paidDate: DateTime.now(),
      paid: false,
      dueDate: DateTime.now(),
    ),
    Entries(
      id: 1,
      idUser: 1,
      idCategory: 1,
      description: "Conta de luz",
      period: "Mensal",
      paidValue: 123.45,
      paidDate: DateTime.now(),
      paid: true,
      dueDate: DateTime.now(),
    ),
    Entries(
      id: 2,
      idUser: 1,
      idCategory: 2,
      description: "IPTU",
      period: "Anual",
      paidValue: 542.33,
      paidDate: DateTime.now(),
      paid: false,
      dueDate: DateTime.now(),
    ),
    Entries(
      id: 1,
      idUser: 1,
      idCategory: 1,
      description: "Conta de luz",
      period: "Mensal",
      paidValue: 123.45,
      paidDate: DateTime.now(),
      paid: true,
      dueDate: DateTime.now(),
    ),
    Entries(
      id: 2,
      idUser: 1,
      idCategory: 2,
      description: "IPTU",
      period: "Anual",
      paidValue: 542.33,
      paidDate: DateTime.now(),
      paid: false,
      dueDate: DateTime.now(),
    ),
  ];

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
    return Stack(
      children: [
        DarkStatusBarTheme(
          Column(
            children: [
              Row(
                children: const <Widget>[
                  TitleLabel("Lançamentos"),
                ],
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    FilterButton(
                      "Pagos",
                      () {},
                    ),
                    FilterButton(
                      "Mês",
                      () {},
                    ),
                    FilterButton(
                      "Categoria",
                      () {},
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 8.0,
                  horizontal: 20.0,
                ),
                child: InputSearch(),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.59,
                child: ListView.builder(
                  itemCount: _entries.length,
                  itemBuilder: (context, index) {
                    final entry = _entries[index];
                    return ListTileCard(
                      () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ShowEntryScreen(),
                          ),
                        );
                      },
                      entry.idCategory == 1
                          ? SvgPicture.asset(
                              sElectricity,
                              color: cPurple,
                            )
                          : SvgPicture.asset(
                              sHouse,
                              color: cGreen,
                            ),
                      entry.description,
                      """Valor: ${formatCurrency.format(entry.paidValue)}
Data de vencimento: ${DateFormat("dd/MM/y").format(entry.dueDate)}""",
                      entry.paid == true
                          ? SvgPicture.asset(
                              sPaymentTick,
                              color: cGreen,
                            )
                          : SvgPicture.asset(
                              sPaymentWaiting,
                              color: cOrange,
                            ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        Positioned(
          right: 10,
          bottom: 5,
          child: FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CreateEntryScreen(_addEntry),
                ),
              );
            },
            backgroundColor: cBlue,
            child: SvgPicture.asset(
              sAdd,
              color: cWhite,
            ),
          ),
        )
      ],
    );
  }
}
