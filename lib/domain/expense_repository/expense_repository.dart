import 'package:exam/data/models/expense/expense.dart';
import 'package:exam/data/services/expense_services/expence_services.dart';

class ExpenseRepository {
  final expenseService = ExpenceServices();

  Future<List<Expense>> getExpenses() {
    return expenseService.get();
  }

  Future<void> addExpense(
      int id, String title, String category, double amount, DateTime date) {
    return expenseService.insert(
      id: id,
      title: title,
      category: category,
      amount: amount,
      date: date,
    );
  }

  // Future<void> updateExpense(
  //     int id, String title, String category, double amount, DateTime date) {
  //   return expenseService.
  // }
}
