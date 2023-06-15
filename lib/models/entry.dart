class Entry {
  final int id;
  final bool paid;
  final String description;
  final int idCategory;
  final int idRecurrence;
  final int idPaymentType;
  final double paidValue;
  final DateTime dueDate;

  Entry({
    required this.id,
    required this.paid,
    required this.description,
    required this.idCategory,
    required this.idRecurrence,
    required this.idPaymentType,
    required this.paidValue,
    required this.dueDate,
  });
}
