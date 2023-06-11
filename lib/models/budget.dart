class Budget {
  final int id;
  final int idUser;
  final int idCategory;
  final double value;
  final double availableValue;

  Budget({
    required this.id,
    required this.idUser,
    required this.idCategory,
    required this.value,
    required this.availableValue,
  });
}
