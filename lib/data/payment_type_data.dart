import '../models/payment_type.dart';

List<PaymentType> paymentOptions = [
  PaymentType(
    id: 1,
    description: "Conta",
    type: "ACCOUNT",
  ),
  PaymentType(
    id: 2,
    description: "Cartão de crédito",
    type: "CREDIT_CARD",
  ),
];
