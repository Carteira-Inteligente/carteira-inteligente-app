import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../constants/colors.dart';
import '../../constants/svgs.dart';
import '../Labels/subtitle2_label.dart';
import '../Labels/subtitle_label.dart';

class NoEntryContainer extends StatelessWidget {
  const NoEntryContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50.0),
      child: Column(
        children: <Widget>[
          const SubtitleLabel(label: "Não existem lançamentos cadastrados."),
          Padding(
            padding: const EdgeInsets.only(top: 25.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Subtitle2Label(label: "Toque em "),
                SvgPicture.asset(
                  sAddCircle,
                  color: cGrey,
                ),
                const Subtitle2Label(label: " ou em "),
                ElevatedButton(
                  onPressed: null,
                  style: ElevatedButton.styleFrom(
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(50),
                      ),
                    ),
                    backgroundColor: cGrey.shade800,
                    elevation: 0,
                  ),
                  child: SvgPicture.asset(
                    sAdd,
                    color: cWhite,
                  ),
                ),
              ],
            ),
          ),
          const Subtitle2Label(label: "para cadastrar um lançamento rápido."),
        ],
      ),
    );
  }
}

class NoDataContainer extends StatelessWidget {
  const NoDataContainer({
    super.key,
    required this.description,
  });

  final String description;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50.0),
      child: Column(
        children: <Widget>[
          SubtitleLabel(label: "Não existem $description cadastrados."),
          Padding(
            padding: const EdgeInsets.only(top: 25.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Subtitle2Label(label: "Toque em "),
                SvgPicture.asset(
                  sAddCircle,
                  color: cGrey,
                ),
              ],
            ),
          ),
          const Subtitle2Label(label: "para realizar o cadastro."),
        ],
      ),
    );
  }
}

class NoEntryBudgetContainer extends StatelessWidget {
  const NoEntryBudgetContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50.0),
      child: Column(
        children: <Widget>[
          Text(
            "Não existem lançamentos vinculados a este orçamento.",
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ],
      ),
    );
  }
}
