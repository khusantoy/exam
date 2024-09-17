import 'package:exam/data/models/expense/expense.dart';
import 'package:exam/domain/expense_repository/expense_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'expense_event.dart';
part 'expense_state.dart';

class ExpenseBloc extends Bloc<ExpenseEvent, ExpenseState> {
  ExpenseBloc() : super(ExpenseInitialState()) {
    on<GetExpensesEvent>(_onGetExpenses);
    on<AddExpenseEvent>(_addExpense);
  }

  Future<void> _onGetExpenses(GetExpensesEvent event, emit) async {
    emit(ExpenseLoadingState());
    final ExpenseRepository expenseRepository = ExpenseRepository();
    try {
      final expenses = await expenseRepository.getExpenses();

      emit(ExpenseLoadedState(expenses));
    } catch (e) {
      emit(ExpenseErrorState(e.toString()));
    }
  }

  Future<void> _addExpense(AddExpenseEvent event, emit) async {
    final ExpenseRepository expenseRepository = ExpenseRepository();
    try {
      await expenseRepository.addExpense(
          event.id, event.title, event.category, event.amount, event.date);
      add(GetExpensesEvent());
    } catch (e) {
      emit(ExpenseErrorState(e.toString()));
    }
  }
}

// Future<void> _updateExpense(UpdateExpenseEvent event, emit) async {
//   emit(ExpenseLoadingState());
//   final ExpenseRepository expenseRepository = ExpenseRepository();
//   try {
//     await expenseRepository.update(
//       event.id,
//     );
//     add(GetExpensesEvent());
//   } catch (e) {
//     emit(ExpenseErrorState(e.toString()));
//   }
// }
