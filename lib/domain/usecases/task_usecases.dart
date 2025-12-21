import 'package:daily_track/domain/entities/task.dart';
import 'package:daily_track/domain/repositories/task_repository.dart';

class TaskUseCases {
  final TaskRepository _repository;

  const TaskUseCases({
    required TaskRepository repository,
  }) : _repository = repository;

  void _validate(String variable, String name) => variable.isEmpty ? throw Exception("Invalid $name") : null;
  void _validateID(int id) => id <= 0 ? throw Exception("Invalid ID") : null;

  Future<List<Task>> getAllTasks(String uuid) async {
    _validate(uuid, "UUID");
    
    return await _repository.getAllTasks(uuid);
  }

  Future<void> addTask(Task task) async {
    _validate(task.name, "Name");
    _validate(task.description, "Description");

    await _repository.addTask(task);
  }

  Future<void> deleteTask(int id) async {
    _validateID(id);

    await _repository.deleteTask(id);
  }

  Future<void> updateTask(Task task) async {
    _validateID(task.id!);
    _validate(task.name, "Name");
    _validate(task.description, "Description");

    await _repository.updateTask(task);
  }
}