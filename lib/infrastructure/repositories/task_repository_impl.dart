import 'package:daily_track/domain/entities/task.dart';
import 'package:daily_track/domain/entities/user.dart';
import 'package:daily_track/domain/repositories/task_repository.dart';
import 'package:daily_track/infrastructure/database/database.dart';

class TaskRepositoryImpl implements TaskRepository {
  final DailyTrackDatabase _dbManager;

  TaskRepositoryImpl({ 
    required DailyTrackDatabase dbManager
  }) : _dbManager = dbManager;

  // Get All Users Tasks from DB
  @override
  Future<List<Task>> getAllTasks(String uuid) async {
    try {
      final db = await _dbManager.database;

      final tasks = await db.query(
        'tasks',
        where: 'uuid = ?',
        whereArgs: [uuid],
      );

      return [];
      //return tasks.map((task) => Task.fromJson(task));
    } catch(e) {
      throw Exception("Internal Error");
    }
  }

  // Add Task on DB
  @override
  Future<void> addTask(Task task) async {
    try {
      final db = await _dbManager.database;

      await db.insert(
        'tasks', 
        task.toJson(),
      );
    } catch(e) {
      throw Exception("Internal Error");
    }
  }

  // Delete Task from DB
  @override
  Future<void> deleteTask(int id) async {
    try {
      final db = await _dbManager.database;

      await db.delete(
        'tasks', 
        where: 'id = ?',
        whereArgs: [id],
      );
    } catch(e) {
      throw Exception("Internal Error");
    }
  }

  // Update Task on DB
  @override
  Future<void> updateTask(Task task) async {
    try {
      final db = await _dbManager.database;

      await db.update(
        'tasks', 
        task.toJson(),
        where: 'id = ?',
        whereArgs: [task.id],
      );
    } catch(e) {
      throw Exception("Internal Error");
    }
  }

}