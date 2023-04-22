import 'package:carteira_inteligente/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NoDataContainer extends StatelessWidget {
  const NoDataContainer(this.description, {super.key});

  final String description;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50.0),
      child: Column(
        children: <Widget>[
          Text(
            "Não existem $description cadastrados",
            style: Theme.of(context).textTheme.titleMedium,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 25.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Toque em ",
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                CircleAvatar(
                  backgroundColor: cGrey.shade600,
                  radius: 16,
                  child: SvgPicture.asset(
                    sAdd,
                    color: cWhite,
                  ),
                ),
              ],
            ),
          ),
          Text(
            "para cadastrar um lançamento",
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ],
      ),
    );
  }
}
