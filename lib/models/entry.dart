class Entry {
  final int id;
  final int idUser;
  final int idCategory;
  final String description;
  final int period;
  final double paidValue;
  final DateTime paidDate;
  final bool paid;
  final DateTime dueDate;

  Entry({
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
