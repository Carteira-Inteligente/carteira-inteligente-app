import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../constants/colors.dart';
import '../../constants/svgs.dart';
import '../../screens/Notification/notification_screen.dart';

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
