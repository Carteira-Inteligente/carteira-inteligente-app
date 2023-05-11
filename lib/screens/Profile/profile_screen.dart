import 'package:carteira_inteligente/constants/constants.dart';
import 'package:carteira_inteligente/widgets/Buttons/dialog_action_button.dart';
import 'package:carteira_inteligente/widgets/Labels/modal_label.dart';
import 'package:carteira_inteligente/widgets/Labels/subtitle_label.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 15.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: wBorderRadius50,
              border: Border.all(color: cGrey.shade200),
            ),
            child: CircleAvatar(
              backgroundColor: cGrey.shade200,
              radius: 45,
              child: Container(
                padding: const EdgeInsets.all(6.0),
                child: SvgPicture.asset(
                  sUser,
                  height: 45,
                ),
              ),
            ),
          ),
        ),
        const SubtitleLabel("Thiago Martins Proença"),
        const ModalLabel("thiagoenca@gmail.com"),
        DialogActionButton(
          () {},
          cGrey.shade600,
          "Editar perfil",
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          child: Divider(),
        ),
      ],
    );
  }
}
