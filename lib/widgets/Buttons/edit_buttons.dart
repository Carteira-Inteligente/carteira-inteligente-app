import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../constants/colors.dart';
import '../../constants/svgs.dart';
import '../../constants/widgets.dart';
import '../Containers/button_containers.dart';

class EditButton extends StatelessWidget {
  const EditButton({
    super.key,
    required this.onPressed,
  });

  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ButtonContainer(
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          minimumSize: Size(MediaQuery.of(context).size.width * 0.4, 60),
          shape: wButtonBorderRadius,
          backgroundColor: cGrey.shade800,
          elevation: 0,
        ),
        onPressed: onPressed,
        icon: SvgPicture.asset(
          sEdit,
          color: cWhite,
        ),
        label: Text(
          "Editar",
          style: Theme.of(context).textTheme.labelLarge,
        ),
      ),
    );
  }
}

class IconEditButton extends StatelessWidget {
  const IconEditButton({
    super.key,
    required this.onPressed,
  });

  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ButtonContainer(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: wRoundButtonSize,
          shape: wButtonBorderRadius,
          side: BorderSide(color: cGrey.shade800),
          backgroundColor: cWhite,
          elevation: 0,
        ),
        onPressed: onPressed,
        child: SvgPicture.asset(
          sEdit,
          color: cGrey.shade800,
        ),
      ),
    );
  }
}

class IconEditPaymentButton extends StatelessWidget {
  const IconEditPaymentButton({
    super.key,
    required this.paid,
    required this.onPressed,
  });

  final bool paid;
  final void Function(bool) onPressed;

  @override
  Widget build(BuildContext context) {
    return ButtonContainer(
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          minimumSize: Size(MediaQuery.of(context).size.width * 0.4, 60),
          shape: wButtonBorderRadius,
          side: BorderSide(
            color: paid == true ? cGreen.shade50 : cOrange.shade50,
          ),
          backgroundColor: paid == true ? cGreen.shade50 : cOrange.shade50,
          elevation: 0,
        ),
        icon: paid == true
            ? SvgPicture.asset(
                sPaymentTick,
                color: cGreen.shade800,
              )
            : SvgPicture.asset(
                sPaymentWaiting,
                color: cOrange.shade800,
              ),
        onPressed: () => onPressed,
        label: Text(
          paid == true ? "Pago" : "Pagar",
          style: TextStyle(
            fontFamily: "OpenSans",
            fontSize: 16,
            color: paid == true ? cGreen.shade800 : cOrange.shade800,
          ),
        ),
      ),
    );
  }
}
