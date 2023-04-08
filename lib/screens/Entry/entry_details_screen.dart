import 'package:carteira_inteligente_app/widgets/Buttons/delete_button.dart';
import 'package:carteira_inteligente_app/widgets/Buttons/edit_button.dart';
import 'package:carteira_inteligente_app/widgets/Inputs/input_details.dart';
import 'package:carteira_inteligente_app/widgets/Labels/modal_label.dart';
import 'package:flutter/material.dart';

class EntryDetailsScreen extends StatefulWidget {
  const EntryDetailsScreen({super.key});

  @override
  State<EntryDetailsScreen> createState() => _EntryDetailsScreenState();
}

class _EntryDetailsScreenState extends State<EntryDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const ModalLabel("Detalhes da despesa"),
        const InputDetails(
          "Pagamento realizado",
          "Sim",
        ),
        const InputDetails(
          "Categoria",
          "Energia elétrica",
        ),
        const InputDetails(
          "Descrição",
          "Conta de luz",
        ),
        const InputDetails(
          "Recorrência",
          "Mensal",
        ),
        Row(
          children: const <Widget>[
            Expanded(
                flex: 1,
                child: Padding(
                  padding: EdgeInsets.only(right: 4.0),
                  child: InputDetails(
                    "Valor",
                    "R\$ 123,45",
                  ),
                )),
            Expanded(
                flex: 1,
                child: Padding(
                  padding: EdgeInsets.only(left: 4.0),
                  child: InputDetails(
                    "Valor pago",
                    "R\$ 123,45",
                  ),
                )),
          ],
        ),
        Row(
          children: const <Widget>[
            Expanded(
                flex: 1,
                child: Padding(
                  padding: EdgeInsets.only(right: 4.0),
                  child: InputDetails(
                    "Data de vencimento",
                    "01/04/2023",
                  ),
                )),
            Expanded(
                flex: 1,
                child: Padding(
                  padding: EdgeInsets.only(left: 4.0),
                  child: InputDetails(
                    "Data de pagamento",
                    "01/04/2023",
                  ),
                )),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            EditButton(() {}),
            DeleteButton("lançamento", () {}),
          ],
        )
      ],
    );
  }
}
