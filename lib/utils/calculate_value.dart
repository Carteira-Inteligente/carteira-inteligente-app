import '../models/budget.dart';
import '../models/entry.dart';

double calculateTotalValue(List<Entry> entries, Budget budget) {
  final DateTime currentDate = DateTime.now();
  final int currentMonth = currentDate.month;
  double totalValue = 0;

  for (final entry in entries) {
    final DateTime entryDate = entry.dueDate;
    final int entryMonth = entryDate.month;

    if (entry.category.id == budget.category.id && entryMonth == currentMonth) {
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
    if (entry.paid == false &&
        entry.dueDate.isBefore(DateTime.now().subtract(
          const Duration(days: 1),
        ))) {
      overdueValue += entry.paidValue;
    }
  }

  return overdueValue;
}
