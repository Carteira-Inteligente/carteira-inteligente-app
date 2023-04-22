import 'package:carteira_inteligente/constants/constants.dart';
import 'package:carteira_inteligente/widgets/Buttons/delete_button.dart';
import 'package:carteira_inteligente/widgets/Buttons/edit_button.dart';
import 'package:carteira_inteligente/widgets/Inputs/input_details.dart';
import 'package:carteira_inteligente/widgets/Labels/modal_label.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BudgetDetailsScreen extends StatefulWidget {
  const BudgetDetailsScreen({super.key});

  @override
  State<BudgetDetailsScreen> createState() => _BudgetDetailsScreenState();
}

class _BudgetDetailsScreenState extends State<BudgetDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const ModalLabel("Detalhes do lançamento"),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 30.0),
                child: EditButton(() {}),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: wBorderRadius50,
                  border: Border.all(color: cGrey.shade300),
                ),
                child: CircleAvatar(
                  backgroundColor: cTransparent,
                  radius: 34,
                  child: Container(
                    padding: const EdgeInsets.all(6.0),
                    child: SvgPicture.asset(
                      sElectricity,
                      color: cAmber,
                      height: 34,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30.0),
                child: DeleteButton("lançamento", () {}),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 30.0),
          child: Column(children: [
            Text(
              "Conta de luz",
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            Text(
              "R\$ 123,45",
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const Divider(color: cGrey),
            Row(
              children: const <Widget>[
                Expanded(
                  flex: 1,
                  child: InputDetails(
                    "Status de pagamento",
                    "Pago",
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: InputDetails(
                    "Data de vencimento",
                    "01/04/2023",
                  ),
                ),
              ],
            ),
            Row(
              children: const <Widget>[
                Expanded(
                  flex: 1,
                  child: InputDetails(
                    "Recorrência",
                    "Mensal",
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: InputDetails(
                    "Data de pagamento",
                    "01/04/2023",
                  ),
                ),
              ],
            ),
          ]),
        )

        // Padding(
        //   padding: const EdgeInsets.only(top: 20.0),
        //   child: Row(
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     children: <Widget>[
        //       EditButton(() {}),
        //       DeleteButton("lançamento", () {}),
        //     ],
        //   ),
        // )
      ],
    );
  }
}
