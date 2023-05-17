import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../constants/colors.dart';
import '../../constants/svgs.dart';
import '../Labels/subtitle2_label.dart';
import '../Labels/subtitle_label.dart';

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
          SubtitleLabel(label: "Não existem $description cadastrados"),
          Padding(
            padding: const EdgeInsets.only(top: 25.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Subtitle2Label(label: "Toque em"),
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
                const Subtitle2Label(label: "ou em"),
                SvgPicture.asset(
                  sAdd,
                  color: cGrey,
                ),
              ],
            ),
          ),
          const Subtitle2Label(label: "para cadastrar um lançamento"),
        ],
      ),
    );
  }
}
