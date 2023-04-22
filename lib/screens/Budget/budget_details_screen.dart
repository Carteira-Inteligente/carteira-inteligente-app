import 'package:carteira_inteligente/constants/constants.dart';
import 'package:carteira_inteligente/models/entries.dart';
import 'package:carteira_inteligente/screens/Entry/entry_details_screen.dart';
import 'package:carteira_inteligente/utils/show_dialog.dart';
import 'package:carteira_inteligente/utils/show_modal.dart';
import 'package:carteira_inteligente/utils/toast_message.dart';
import 'package:carteira_inteligente/widgets/Buttons/delete_button.dart';
import 'package:carteira_inteligente/widgets/Buttons/edit_button.dart';
import 'package:carteira_inteligente/widgets/Cards/entry_card.dart';
import 'package:carteira_inteligente/widgets/Containers/form_container.dart';
import 'package:carteira_inteligente/widgets/Labels/subtitle_label.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BudgetDetailsScreen extends StatefulWidget {
  const BudgetDetailsScreen({super.key});

  @override
  State<BudgetDetailsScreen> createState() => _BudgetDetailsScreenState();
}

class _BudgetDetailsScreenState extends State<BudgetDetailsScreen> {
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
  ];

  @override
  Widget build(BuildContext context) {
    return FormContainer(
      "Detalhes do orçamento",
      Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6.0),
                  child: Row(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: wBorderRadius50,
                          border: Border.all(
                            color: cGrey.shade300,
                          ),
                        ),
                        child: CircleAvatar(
                          backgroundColor: cTransparent,
                          radius: 24,
                          child: Container(
                            padding: const EdgeInsets.all(6.0),
                            child: SvgPicture.asset(
                              sElectricity,
                              color: cAmber,
                            ),
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 8.0),
                        child: SubtitleLabel("Energia elétrica"),
                      ),
                    ],
                  ),
                ),
                Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Row(
                        children: <Widget>[
                          Text(
                            "Disponível",
                            style: Theme.of(context).textTheme.displaySmall,
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        const Text(
                          "R\$ 500,00",
                          style: TextStyle(
                            fontFamily: "OpenSans",
                            color: cBlack,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          " de R\$ 880,00",
                          style: Theme.of(context).textTheme.displaySmall,
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: SizedBox(
                        height: 10,
                        width: MediaQuery.of(context).size.width,
                        child: Stack(
                          alignment: Alignment.centerLeft,
                          children: <Widget>[
                            Container(
                              decoration: BoxDecoration(
                                color: cGrey.shade300,
                                borderRadius: BorderRadius.circular(50),
                              ),
                            ),
                            FractionallySizedBox(
                              widthFactor: 0.3,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: cGreen,
                                  borderRadius: BorderRadius.circular(50),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Divider(
                  color: cGrey.shade400,
                ),
              ],
            ),
          ),
          Column(
            children: <Widget>[
              Row(
                children: const <Widget>[
                  SubtitleLabel("Lançamentos do mês"),
                ],
              ),
              _entries.isEmpty
                  ? Padding(
                      padding: const EdgeInsets.only(top: 50.0),
                      child: Column(
                        children: <Widget>[
                          Text(
                            "Nenhum lançamento encontrado",
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                        ],
                      ),
                    )
                  : SizedBox(
                      height: MediaQuery.of(context).size.height * 0.71,
                      child: ListView.builder(
                        itemCount: _entries.length,
                        itemBuilder: (context, index) {
                          final entry = _entries[index];

                          return EntryCard(
                            () => ShowModal.showModal(
                              context,
                              const EntryDetailsScreen(),
                            ),
                            entry.idCategory == 1
                                ? SvgPicture.asset(
                                    sElectricity,
                                    color: cAmber,
                                  )
                                : SvgPicture.asset(
                                    sHouse,
                                    color: cCyan,
                                  ),
                            entry.description,
                            """Valor: R\$ 100,00
Vencimento: 14/12/2023""",
                            entry.paid == true
                                ? SvgPicture.asset(
                                    sPaymentTick,
                                    color: cGreen,
                                  )
                                : SvgPicture.asset(
                                    sPaymentWaiting,
                                    color: cOrange,
                                  ),
                            entry.paid == true
                                ? () {
                                    ShowDialog.cancelPayment(context, () {
                                      Navigator.pop(context);
                                      ToastMessage.showToast(
                                          "Pagamento desfeito com sucesso.");
                                      entry.paid == false;
                                    });
                                  }
                                : () {
                                    ToastMessage.showToast(
                                        "Pagamento realizado com sucesso.");
                                    entry.paid == true;
                                  },
                          );
                        },
                      ),
                    ),
            ],
          )
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: EditButton(() {}),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: DeleteButton("orçamento", () {}),
          ),
        ],
      ),
    );
  }
}
