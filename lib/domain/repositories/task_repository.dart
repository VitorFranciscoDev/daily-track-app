import 'package:daily_track/domain/entities/task.dart';

abstract class TaskRepository {
  Future<List<Task>> getAllTasks(String uuid);
  Future<void> addTask(Task task);
  Future<void> deleteTask(int id);
  Future<void> updateTask(Task task);
}