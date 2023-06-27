import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../models/notifications.dart';
import '../../models/payment_type.dart';
import '../../services/payment_type_service.dart';
import '../../widgets/Buttons/secondary_buttons.dart';
import '../../widgets/Cards/notification_card.dart';
import '../../widgets/Containers/form_containers.dart';
import '../../widgets/Containers/progress_containers.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  List<PaymentType> _paymentTypes = [];
  final List<Notifications> _notifications = [
    Notifications(
      id: 1,
      description: "Hoje é dia de pagar Condomínio",
      dateTime: DateTime.now(),
    ),
    Notifications(
      id: 2,
      description: "Hoje é dia de pagar Netflix",
      dateTime: DateTime.now(),
    ),
    Notifications(
      id: 3,
      description: "Hoje é dia de pagar Conta de luz",
      dateTime: DateTime.now(),
    ),
    Notifications(
      id: 4,
      description: "Hoje é dia de pagar IPTU",
      dateTime: DateTime.now(),
    ),
    Notifications(
      id: 1,
      description: "Hoje é dia de pagar Condomínio",
      dateTime: DateTime.now(),
    ),
    Notifications(
      id: 2,
      description: "Hoje é dia de pagar Netflix",
      dateTime: DateTime.now(),
    ),
    Notifications(
      id: 3,
      description: "Hoje é dia de pagar Conta de luz",
      dateTime: DateTime.now(),
    ),
    Notifications(
      id: 4,
      description: "Hoje é dia de pagar IPTU",
      dateTime: DateTime.now(),
    ),
  ];
  bool _isLoading = false;

  Future<List<PaymentType>> _fetchNotifications() async {
    setState(() {
      _isLoading = true;
    });

    final paymentTypes = await PaymentTypeService.findAll("Contas");

    setState(() {
      _isLoading = false;
      _paymentTypes = paymentTypes;
    });

    return paymentTypes;
  }

  @override
  void initState() {
    super.initState();
    _fetchNotifications();
  }

  _buildNotificationCard(BuildContext context, Notifications notifications) {
    return NotificationListCard(
      description: notifications.description,
      onDelete: () {},
      dateTime: DateFormat("dd MMMM", "pt-BR").format(
        notifications.dateTime,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FormContainer(
      title: "Notificações",
      bottonButton: SecondaryButton(
        textButton: "Limpar tudo",
        onPressed: () {},
      ),
      child: _isLoading
          ? ProgressIndicatorContainer(visible: _isLoading)
          : RefreshIndicator(
              onRefresh: _fetchNotifications,
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: ListView.builder(
                  itemCount: _notifications.length,
                  itemBuilder: (context, index) {
                    final notification = _notifications[index];
                    return _buildNotificationCard(context, notification);
                  },
                ),
              ),
            ),
    );
  }
}
