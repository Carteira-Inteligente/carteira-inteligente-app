class Entries {
  final int id;
  final int idUser;
  final int idCategory;
  final String description;
  final String period;
  final double paidValue;
  final DateTime paidDate;
  final bool paid;
  final DateTime dueDate;

  Entries({
    required this.id,
    required this.idUser,
    required this.idCategory,
    required this.description,
    required this.period,
    required this.paidValue,
    required this.paidDate,
    required this.paid,
    required this.dueDate,
  });
}
