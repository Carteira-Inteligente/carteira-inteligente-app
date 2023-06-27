import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../constants/colors.dart';
import '../../constants/svgs.dart';
import '../Containers/card_container.dart';
import '../Containers/rounded_icon_container.dart';

class NotificationListCard extends StatelessWidget {
  const NotificationListCard({
    super.key,
    required this.description,
    required this.onDelete,
    required this.dateTime,
  });

  final String description;
  final VoidCallback onDelete;
  final String dateTime;

  @override
  Widget build(BuildContext context) {
    return CardContainer(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: ListTile(
          leading: RoundedIconContainer(
            pathIcon: sNotificationBing,
            backgroundColor: cRed.shade50,
            iconColor: cRed.shade900,
            radius: 24,
          ),
          title: Text(
            description,
            style: Theme.of(context).textTheme.displaySmall,
          ),
          subtitle: Text(
            dateTime,
            style: const TextStyle(
              fontFamily: "OpenSans",
              fontSize: 12,
              fontWeight: FontWeight.normal,
              color: cGrey,
            ),
          ),
          trailing: IconButton(
            icon: SvgPicture.asset(
              sDelete,
              color: cGrey.shade600,
            ),
            onPressed: onDelete,
          ),
        ),
      ),
    );
  }
}
