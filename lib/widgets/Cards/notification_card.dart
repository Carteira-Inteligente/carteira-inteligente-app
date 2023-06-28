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
    required this.read,
  });

  final String description;
  final VoidCallback onDelete;
  final String dateTime;
  final bool read;

  @override
  Widget build(BuildContext context) {
    return CardContainer(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: ListTile(
          leading: RoundedIconContainer(
            pathIcon: read ? sNotification : sNotificationBing,
            backgroundColor: read ? cGrey.shade50 : cRed.shade50,
            iconColor: read ? cBlack : cRed.shade900,
            radius: 24,
          ),
          title: Text(
            description,
            style: Theme.of(context).textTheme.displaySmall,
          ),
          subtitle: Row(
            children: <Widget>[
              Text(
                "$dateTime • ",
                style: const TextStyle(
                  fontFamily: "OpenSans",
                  fontSize: 12,
                  fontWeight: FontWeight.normal,
                  color: cGrey,
                ),
              ),
              Text(
                read ? "lido" : "não lido",
                style: TextStyle(
                  fontFamily: "OpenSans",
                  fontSize: 12,
                  fontWeight: FontWeight.normal,
                  color: cBlue.shade800,
                ),
              ),
            ],
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
