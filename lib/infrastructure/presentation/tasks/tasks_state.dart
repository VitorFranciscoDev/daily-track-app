import 'package:daily_track/domain/entities/task.dart';
import 'package:daily_track/domain/usecases/task_usecases.dart';
import 'package:flutter/material.dart';

class TasksProvider with ChangeNotifier {
  final TaskUseCases _useCases;

  TasksProvider({
    required TaskUseCases useCases,
  }) : _useCases = useCases;

  List<Task> _tasks = [
    Task(name: "aaaaa", description: "ppapa", isDone: true),
    Task(name: "papa", description: "iwiw", isDone: false),
    Task(name: "oaoa", description: "ee", isDone: true),
  ];
  List<Task> get tasks => _tasks;

  bool _isInitialized = false;
  bool get isInitialized => _isInitialized;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> getAllTasks(String uuid) async {
    _tasks = await _useCases.getAllTasks(uuid);
    notifyListeners();
  }

  Future<void> addTask(Task task) async {
    return await _useCases.addTask(task);
  }

  Future<void> deleteTask(int id) async {
    return await _useCases.deleteTask(id);
  } 

  Future<void> updateTask(Task task) async {
    return await _useCases.updateTask(task);
  }
}