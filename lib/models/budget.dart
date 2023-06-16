import 'category.dart';

class Budget {
  final int id;
  final Category category;
  final String description;
  final double value;

  Budget({
    required this.id,
    required this.category,
    required this.description,
    required this.value,
  });

  factory Budget.fromJson(Map<String, dynamic> json) {
    return Budget(
      id: json["id"],
      category: Category.fromJson(json["category"]),
      description: json["description"],
      value: json["value"].toDouble(),
    );
  }
}
