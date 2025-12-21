import 'package:daily_track/infrastructure/database/tasks_table.dart';
import 'package:daily_track/infrastructure/database/users_table.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

class DailyTrackDatabase {
  static final DailyTrackDatabase _instance = DailyTrackDatabase._internal();
  factory DailyTrackDatabase() => _instance;
  DailyTrackDatabase._internal();
  static Database? db;

  // DB getter
  Future<Database> get database async {
    if(db != null) return db!;
    db = await _initDatabase();
    return db!;
  }

  // Init DB
  Future<Database> _initDatabase() async {
    final databaseDirPath = await getDatabasesPath();
    final databasePath = join(databaseDirPath, 'daily_track.db');

    return await openDatabase(
      databasePath,
      version: 1,
      onCreate: (db, version) async {
        await UsersTable.createTable(db);
        await TasksTable.createTable(db);
      },
    );
  }
}