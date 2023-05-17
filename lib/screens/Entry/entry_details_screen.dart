import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../constants/colors.dart';
import '../../constants/svgs.dart';
import '../../constants/widgets.dart';
import '../../widgets/Buttons/rounded_delete_button.dart';
import '../../widgets/Buttons/rounded_edit_button.dart';
import '../../widgets/Containers/divider_container.dart';
import '../../widgets/Inputs/input_details.dart';
import '../../widgets/Labels/modal_title_label.dart';

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
        const ModalTitleLabel("Detalhes do lançamento"),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: 30.0),
                child: RoundedEditButton(
                  () {},
                ),
              ),
              Container(
                decoration: const BoxDecoration(
                  borderRadius: wBorderRadius50,
                ),
                child: CircleAvatar(
                  backgroundColor: cAmber.shade700,
                  radius: 34,
                  child: Container(
                    padding: const EdgeInsets.all(6.0),
                    child: SvgPicture.asset(
                      sElectricity,
                      color: cWhite,
                      height: 34,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30.0),
                child: RoundedDeleteButton(
                  "lançamento",
                  () {},
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 30.0),
          child: Column(
            children: <Widget>[
              Text(
                "Conta de luz",
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              Text(
                "R\$ 123,45",
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const DividerContainer(),
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
            ],
          ),
        )
      ],
    );
  }
}
