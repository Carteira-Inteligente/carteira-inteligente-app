import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../constants/constants.dart';

class EditButton extends StatelessWidget {
  const EditButton(this.onPressed, {super.key});

  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: cEditButton,
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(50),
              ),
            ),
            child: ElevatedButton.icon(
              icon: SvgPicture.asset(
                sEdit,
                color: cWhite,
              ),
              style: ElevatedButton.styleFrom(
                  textStyle: const TextStyle(
                    fontSize: 20,
                  ),
                  minimumSize: const Size(170, 60),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(50),
                    ),
                  ),
                  backgroundColor: cTransparent,
                  elevation: 0),
              onPressed: onPressed,
              label: Text(
                "Editar",
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
          )
        ],
      ),
    );
  }
}
