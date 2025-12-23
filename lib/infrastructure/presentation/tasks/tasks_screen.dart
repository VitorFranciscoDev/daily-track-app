import 'package:daily_track/infrastructure/presentation/auth/components/title.dart';
import 'package:daily_track/infrastructure/presentation/tasks/tasks_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TasksScreen extends StatefulWidget {
  const TasksScreen({super.key});

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = context.watch<TasksProvider>();
    
    return Column(
      children: [
        const SizedBox(height: 50),

        Padding(
          padding: const EdgeInsetsGeometry.symmetric(horizontal: 30),
          child: TitleComponent(title: "Tasks"),
        ),

        
      ],
    );
  }
}