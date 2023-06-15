class Budget {
  final int id;
  final int idCategory;
  final String description;
  final double value;

  Budget({
    required this.id,
    required this.idCategory,
    required this.description,
    required this.value,
  });

  factory Budget.fromJson(Map<String, dynamic> json) {
    return Budget(
      id: json['id'],
      idCategory: json['category.id'] ?? 0,
      description: json['description'],
      value: json['value'].toDouble(),
    );
  }
}
