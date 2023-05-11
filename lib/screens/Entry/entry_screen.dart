import 'package:carteira_inteligente/constants/constants.dart';
import 'package:carteira_inteligente/screens/Entry/entry_details_screen.dart';
import 'package:carteira_inteligente/utils/format_currency.dart';
import 'package:carteira_inteligente/utils/show_dialog.dart';
import 'package:carteira_inteligente/utils/show_modal.dart';
import 'package:carteira_inteligente/utils/toast_message.dart';
import 'package:carteira_inteligente/widgets/Cards/entry_card.dart';
import 'package:carteira_inteligente/widgets/Containers/category_icon_container.dart';
import 'package:carteira_inteligente/widgets/Containers/no_data_container.dart';
import 'package:carteira_inteligente/models/entries.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

class EntryScreen extends StatefulWidget {
  const EntryScreen({super.key});

  @override
  State<EntryScreen> createState() => _EntryScreenState();
}

class _EntryScreenState extends State<EntryScreen> {
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

  Widget _buildEntryCards(BuildContext context, Entries entry) {
    return EntryCard(
      () => ShowModal.showModal(
        context,
        const EntryDetailsScreen(),
      ),
      entry.idCategory == 1
          ? CategoryIconContainer(
              sElectricity,
              cAmber.shade700,
              24,
            )
          : CategoryIconContainer(
              sHouse,
              cCyan.shade700,
              24,
            ),
      entry.description,
      "Valor: ${formatCurrency.format(entry.paidValue)}\n"
      "Vencimento: ${DateFormat("dd/MM/y").format(entry.dueDate)}",
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
              ShowDialog.cancelPayment(
                context,
                () {
                  Navigator.pop(context);
                  ToastMessage.showToast("Pagamento desfeito com sucesso.");
                  entry.paid == false;
                },
              );
            }
          : () {
              ToastMessage.showToast("Pagamento realizado com sucesso.");
              entry.paid == true;
            },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        _entries.isEmpty
            ? const NoDataContainer("lançamentos")
            : SizedBox(
                height: MediaQuery.of(context).size.height * 0.71,
                child: ListView.builder(
                  itemCount: _entries.length,
                  itemBuilder: (context, index) {
                    final entry = _entries[index];

                    if (index == _entries.length - 1) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 35.0),
                        child: _buildEntryCards(context, entry),
                      );
                    } else {
                      return _buildEntryCards(context, entry);
                    }
                  },
                ),
              ),
      ],
    );
  }
}
