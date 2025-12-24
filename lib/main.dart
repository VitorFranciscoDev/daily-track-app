import 'package:daily_track/domain/usecases/task_usecases.dart';
import 'package:daily_track/domain/usecases/user_usecases.dart';
import 'package:daily_track/infrastructure/database/database.dart';
import 'package:daily_track/infrastructure/presentation/app.dart';
import 'package:daily_track/infrastructure/presentation/auth/auth_state.dart';
import 'package:daily_track/infrastructure/presentation/bottom_navigator/bottom_navigator_state.dart';
import 'package:daily_track/infrastructure/presentation/tasks/tasks_state.dart';
import 'package:daily_track/infrastructure/repositories/task_repository_impl.dart';
import 'package:daily_track/infrastructure/repositories/user_repository_impl.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  final dbManager = DailyTrackDatabase();

  final userRepository = UserRepositoryImpl(dbManager: dbManager);
  final userUseCases = UserUseCases(repository: userRepository);
  
  final taskRepository = TaskRepositoryImpl(dbManager: dbManager);
  final taskUseCases = TaskUseCases(repository: taskRepository);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => BottomNavigatorProvider()),
        ChangeNotifierProvider(create: (_) => AuthProvider(useCases: userUseCases)),
        ChangeNotifierProvider(create: (_) => TasksProvider(useCases: taskUseCases)),
      ],
      child: const MyApp(),
    ),
  );
}