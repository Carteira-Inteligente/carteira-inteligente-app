import '../models/budget.dart';
import '../models/entry.dart';

double calculateTotalValue(List<Entry> entries, Budget budget) {
  double totalValue = 0;

  for (final entry in entries) {
    if (entry.category.id == budget.category.id) {
      totalValue += entry.paidValue;
    }
  }

  return totalValue;
}
