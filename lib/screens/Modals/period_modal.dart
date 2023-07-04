import 'package:flutter/material.dart';

import '../../data/period_data.dart';
import '../../models/period.dart';
import '../../widgets/Cards/recurrence_card.dart';
import '../../widgets/Containers/divider_container.dart';
import '../../widgets/Containers/header_modal_container.dart';

class PeriodModal extends StatefulWidget {
  const PeriodModal({
    super.key,
    required this.onSelected,
  });

  final void Function(String, String) onSelected;

  @override
  State<PeriodModal> createState() => _PeriodModalState();
}

class _PeriodModalState extends State<PeriodModal> {
  final List<Period> _periodOptions = periodOptions;

  _buildPeriodCard(BuildContext context, Period period) {
    return Column(
      children: <Widget>[
        PeriodCard(
          onTap: () {
            widget.onSelected(period.description, period.id);
            Navigator.pop(context);
          },
          description: period.description,
        ),
        const DividerContainer(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const HeaderModalContainer(
          label: "Selecione a recorrência",
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.5,
          child: ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: _periodOptions.length,
            itemBuilder: (context, index) {
              final period = _periodOptions[index];
              return _buildPeriodCard(context, period);
            },
          ),
        ),
      ],
    );
  }
}
