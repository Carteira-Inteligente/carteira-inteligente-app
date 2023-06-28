import '../models/notifications.dart';

List<Notifications> notificationsOptions = [
  Notifications(
    id: 1,
    description: "Hoje é dia de pagar Condomínio",
    dateTime: DateTime.now(),
    read: false,
  ),
  Notifications(
    id: 2,
    description: "Hoje é dia de pagar Netflix",
    dateTime: DateTime.now(),
    read: false,
  ),
  Notifications(
    id: 3,
    description: "Hoje é dia de pagar Conta de luz",
    dateTime: DateTime.now(),
    read: false,
  ),
  Notifications(
    id: 4,
    description: "Amanhã é dia de pagar Condomínio",
    dateTime: DateTime.now().subtract(const Duration(days: 1)),
    read: true,
  ),
  Notifications(
    id: 5,
    description: "Amanhã é dia de pagar Netflix",
    dateTime: DateTime.now().subtract(const Duration(days: 1)),
    read: true,
  ),
  Notifications(
    id: 6,
    description: "Amanhã é dia de pagar Conta de luz",
    dateTime: DateTime.now().subtract(const Duration(days: 1)),
    read: true,
  ),
];
