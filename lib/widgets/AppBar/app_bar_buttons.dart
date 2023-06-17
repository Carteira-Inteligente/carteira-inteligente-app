import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../constants/colors.dart';
import '../../constants/svgs.dart';
import '../../screens/Initial/initial_screen.dart';
import '../../screens/Notification/notification_screen.dart';

class AppBarAddButton extends StatefulWidget {
  const AppBarAddButton({
    super.key,
    required this.tooltip,
    required this.onPressed,
    this.blueIcon,
  });

  final String tooltip;
  final void Function() onPressed;
  final bool? blueIcon;

  @override
  State<AppBarAddButton> createState() => _AppBarAddButtonState();
}

class _AppBarAddButtonState extends State<AppBarAddButton> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      tooltip: widget.tooltip,
      onPressed: widget.onPressed,
      icon: SvgPicture.asset(
        sAddCircle,
        color: widget.blueIcon == true ? cBlue.shade800 : cWhite,
      ),
    );
  }
}

class AppBarFilterButton extends StatefulWidget {
  const AppBarFilterButton({super.key});

  @override
  State<AppBarFilterButton> createState() => _AppBarFilterButtonState();
}

class _AppBarFilterButtonState extends State<AppBarFilterButton> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      tooltip: "Filtrar",
      onPressed: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const InitialScreen(),
        ),
      ),
      icon: SvgPicture.asset(
        sFilter,
        color: cWhite,
      ),
    );
  }
}

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
      onPressed: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const NotificationScreen(),
        ),
      ),
      icon: SvgPicture.asset(
        sNotification,
        color: cWhite,
      ),
    );
  }
}
