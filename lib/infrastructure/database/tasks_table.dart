import 'package:sqflite/sqflite.dart';

class TasksTable {
  static Future<void> createTable(Database db) async {
    await db.execute('''
      CREATE TABLE tasks (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        description TEXT NOT NULL,
        is_done INTEGER NOT NULL
      )
    ''');
  }
}