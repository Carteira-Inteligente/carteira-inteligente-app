class PaymentType {
  final int id;
  final String description;
  final String type;

  PaymentType({
    required this.id,
    required this.description,
    required this.type,
  });

  factory PaymentType.fromJson(Map<String, dynamic> json) {
    return PaymentType(
      id: json['id'],
      description: json['description'],
      type: json['type'],
    );
  }
}
