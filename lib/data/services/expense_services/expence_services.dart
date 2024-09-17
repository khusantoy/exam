import 'package:exam/data/models/expense/expense.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class ExpenceServices {
  late final Database _database;
  final String _dbName = "expense.db";
  final String _table = "expenses";
  final String _idColumn = "id";
  final String _titleColumn = "title";
  final String _categoryColumn = "category";
  final String _amountColumn = "amount";
  final String _dateColumn = "date";

  Future<void> init() async {
    final folder = await getApplicationDocumentsDirectory();
    final path = "${folder.path}/$_dbName";
    _database = await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    final String query = """
      CREATE TABLE $_table 
      (
        $_idColumn INTEGER PRIMARY KEY AUTOINCREMENT,
        $_titleColumn TEXT NOT NULL,
        $_categoryColumn TEXT NOT NULL,
        $_amountColumn TEXT NOT NULL,
        $_dateColumn TEXT NOT NULL
      )
""";

    await db.execute(query);
  }

  Future<List<Expense>> get() async {
    final List<Expense> expenses = [];
    final data = await _database.query(_table);

    for (var item in data) {
      final contact = Expense(
        id: item[_idColumn] as int,
        title: item[_titleColumn] as String,
        category: item[_categoryColumn] as String,
        amount: item[_amountColumn] as double,
        date: item[_dateColumn] as DateTime,
      );

      expenses.add(contact);
    }

    return expenses;
  }

  Future<void> insert({
    required int id,
    required String title,
    required String category,
    required double amount,
    required DateTime date,
  }) async {
    await _database.insert(_table, {
      _idColumn: id,
      _titleColumn: title,
      _categoryColumn: category,
      _amountColumn: amount,
      _dateColumn: date,
    });
  }

  Future<void> update({
    required int id,
    required String title,
    required String category,
    required double amount,
    required DateTime date,
  }) async {
    await _database.update(_table, {
      _idColumn: id,
      _titleColumn: title,
      _categoryColumn: category,
      _amountColumn: amount,
      _dateColumn: date,
    });
  }

  Future<void> delete(int contactId) async {
    await _database.delete(_table, where: "id=$contactId");
  }
}
