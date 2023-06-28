import 'package:carteira_inteligente/constants/colors.dart';
import 'package:carteira_inteligente/data/notifications.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../models/notifications.dart';
import '../../models/payment_type.dart';
import '../../services/payment_type_service.dart';
import '../../widgets/Buttons/secondary_buttons.dart';
import '../../widgets/Cards/notification_card.dart';
import '../../widgets/Containers/form_containers.dart';
import '../../widgets/Containers/progress_containers.dart';
import '../../widgets/Labels/title_labels.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  final List<Notifications> _notifications = notificationsOptions;

  _buildNotificationCard(BuildContext context, Notifications notifications) {
    return NotificationListCard(
      description: notifications.description,
      onDelete: () {},
      dateTime: DateFormat("dd MMMM", "pt-BR").format(
        notifications.dateTime,
      ),
      read: notifications.read,
    );
  }

  @override
  Widget build(BuildContext context) {
    return FormContainer(
      title: "Notificações",
      bottonButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
        child: Text(
          "Seu histórico de notificações fica disponível durante 30 "
          "dias a partir do recebimento.",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: "OpenSans",
            fontSize: 16,
            fontWeight: FontWeight.normal,
            color: cGrey.shade600,
          ),
        ),
      ),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.78,
        child: ListView.builder(
          itemCount: _notifications.length,
          itemBuilder: (context, index) {
            final notification = _notifications[index];
            return _buildNotificationCard(context, notification);
          },
        ),
      ),
    );
  }
}
