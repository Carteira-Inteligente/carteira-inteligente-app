import 'package:intl/intl.dart';

NumberFormat getFormatCurrency() {
  return NumberFormat.currency(
    locale: "pt-BR",
    symbol: "R\$",
    decimalDigits: 2,
  );
}
