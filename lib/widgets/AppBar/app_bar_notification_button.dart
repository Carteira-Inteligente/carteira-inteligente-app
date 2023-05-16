import 'package:carteira_inteligente/constants/constants.dart';
import 'package:carteira_inteligente/screens/Notification/notification_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppBarNotificationButton extends StatefulWidget {
  const AppBarNotificationButton({super.key});

  @override
  State<AppBarNotificationButton> createState() =>
      _AppBarNotificationButtonState();
}

class _AppBarNotificationButtonState extends State<AppBarNotificationButton> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      tooltip: "Notificações",
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const NotificationScreen(),
          ),
        );
      },
      icon: SvgPicture.asset(
        sNotification,
        color: cWhite,
      ),
    );
  }
}
