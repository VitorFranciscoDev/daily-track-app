import 'package:daily_track/domain/entities/task.dart';
import 'package:daily_track/domain/repositories/task_repository.dart';

class TaskUseCases {
  final TaskRepository _repository;

  const TaskUseCases({
    required TaskRepository repository,
  }) : _repository = repository;

  // Validation
  void _validate(String variable, String name) => variable.isEmpty ? throw Exception("Invalid $name") : null;
  void _validateID(int id) => id <= 0 ? throw Exception("Invalid ID") : null;

  // Get All User's Tasks
  Future<List<Task>> getAllTasks(String uuid) async {
    _validate(uuid, "UUID");
    
    return await _repository.getAllTasks(uuid);
  }

  // Add Task in DB
  Future<void> addTask(Task task) async {
    _validate(task.name, "Name");
    _validate(task.description, "Description");

    await _repository.addTask(task);
  }

  // Delete Task from DB
  Future<void> deleteTask(int id) async {
    _validateID(id);

    await _repository.deleteTask(id);
  }

  // Update Task on DB
  Future<void> updateTask(Task task) async {
    _validateID(task.id!);
    _validate(task.name, "Name");
    _validate(task.description, "Description");

    await _repository.updateTask(task);
  }
}