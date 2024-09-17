part of 'expense_bloc.dart';

sealed class ExpenseEvent {}

class GetExpensesEvent extends ExpenseEvent {}

class UpdateExpenseEvent extends ExpenseEvent {
  final int id;
  final String title;
  final String category;
  final double amount;
  final DateTime date;

  UpdateExpenseEvent({
    required this.id,
    required this.title,
    required this.category,
    required this.amount,
    required this.date,
  });
}

class AddExpenseEvent extends ExpenseEvent {
  final int id;
  final String title;
  final String category;
  final double amount;
  final DateTime date;

  AddExpenseEvent({
    required this.id,
    required this.title,
    required this.category,
    required this.amount,
    required this.date,
  });
}

