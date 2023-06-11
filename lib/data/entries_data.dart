import '../models/entry.dart';

List<Entry> entryList = [
  Entry(
    id: 1,
    idUser: 1,
    idCategory: 1,
    description: "Conta de luz",
    period: 5,
    paidValue: 223.45,
    paidDate: DateTime.now(),
    paid: true,
    dueDate: DateTime.now(),
  ),
  Entry(
    id: 2,
    idUser: 1,
    idCategory: 2,
    description: "IPTU",
    period: 9,
    paidValue: 542.33,
    paidDate: DateTime.now(),
    paid: false,
    dueDate: DateTime.now(),
  ),
  Entry(
    id: 1,
    idUser: 1,
    idCategory: 3,
    description: "Cartão de crédito",
    period: 5,
    paidValue: 1456.09,
    paidDate: DateTime.now(),
    paid: false,
    dueDate: DateTime.now(),
  ),
  Entry(
    id: 2,
    idUser: 1,
    idCategory: 4,
    description: "Conta de celular",
    period: 9,
    paidValue: 69.90,
    paidDate: DateTime.now(),
    paid: false,
    dueDate: DateTime.now(),
  ),
];

List<Entry> budgetEntryList = [
  Entry(
    id: 1,
    idUser: 1,
    idCategory: 1,
    description: "Conta de luz",
    period: 5,
    paidValue: 123.45,
    paidDate: DateTime.now(),
    paid: true,
    dueDate: DateTime.now(),
  ),
];
