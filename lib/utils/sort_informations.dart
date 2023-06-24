import '../models/budget.dart';
import '../models/entry.dart';
import '../models/payment_type.dart';

void sortDecriptions(List descriptions) {
  descriptions.sort((a, b) => a.description.toLowerCase().compareTo(
        b.description.toLowerCase(),
      ));
}

void sortBudgetDescriptions(List<Budget> budgets) {
  budgets.sort(
    (a, b) =>
        a.description.toLowerCase().compareTo(b.description.toLowerCase()),
  );
}

void sortAccounts(List<PaymentType> paymentType) {
  paymentType.sort((a, b) {
    if (a.description == 'Carteira') {
      return -1;
    } else {
      return a.description.toLowerCase().compareTo(
            b.description.toLowerCase(),
          );
    }
  });
}

void sortByDate(List<Entry> dueDate) {
  dueDate.sort((a, b) => a.dueDate.compareTo(b.dueDate));
}
