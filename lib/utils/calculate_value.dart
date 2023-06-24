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

double calculatePaidValue(List<Entry> entries) {
  double paidValue = 0;

  for (final entry in entries) {
    if (entry.paid == true) {
      paidValue += entry.paidValue;
    }
  }

  return paidValue;
}

double calculateToPayValue(List<Entry> entries) {
  double toPayValue = 0;

  for (final entry in entries) {
    if (entry.paid == false) {
      toPayValue += entry.paidValue;
    }
  }

  return toPayValue;
}

double calculateOverdueValue(List<Entry> entries) {
  double overdueValue = 0;

  for (final entry in entries) {
    if (entry.paid == false && entry.dueDate.isBefore(DateTime.now())) {
      overdueValue += entry.paidValue;
    }
  }

  return overdueValue;
}
