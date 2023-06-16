import "category.dart";
import "payment_type.dart";

class Entry {
  final int id;
  final bool paid;
  final String description;
  final Category category;
  final String period;
  final PaymentType paymentType;
  final double paidValue;
  final DateTime dueDate;
  final DateTime paidDate;

  Entry({
    required this.id,
    required this.paid,
    required this.description,
    required this.category,
    required this.period,
    required this.paymentType,
    required this.paidValue,
    required this.dueDate,
    required this.paidDate,
  });

  factory Entry.fromJson(Map<String, dynamic> json) {
    return Entry(
      id: json["id"],
      paid: json["paid"],
      description: json["description"],
      category: Category.fromJson(json["category"]),
      period: json["period"],
      paymentType: PaymentType.fromJson(json["paymentType"]),
      paidValue: json["paidValue"],
      dueDate: json["dueDate"],
      paidDate: json["paidDate"],
    );
  }
}
