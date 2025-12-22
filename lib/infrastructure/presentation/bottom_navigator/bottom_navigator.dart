import 'package:daily_track/infrastructure/presentation/auth/settings_screen.dart';
import 'package:daily_track/infrastructure/presentation/bottom_navigator/bottom_navigator_state.dart';
import 'package:daily_track/infrastructure/presentation/tasks/tasks_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BottomNavigatorScreen extends StatelessWidget {
  BottomNavigatorScreen({super.key});

  final List<Widget> pages = [
    TasksScreen(),
    SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final index = context.watch<BottomNavigatorProvider>().index;

    return Scaffold(
      backgroundColor: theme.colorScheme.background,
      body: pages[index],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 20,
              offset: Offset(0, -5),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
          child: BottomNavigationBar(
            currentIndex: index,
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.red,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.grey[500],
            selectedFontSize: 12,
            unselectedFontSize: 11,
            onTap: (newIndex) => context.read<BottomNavigatorProvider>().index = newIndex,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined, size: 26),
                activeIcon: Icon(Icons.home, size: 26),
                label: "Tasks",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined, size: 26),
                activeIcon: Icon(Icons.home, size: 26),
                label: "Tasks",
              ),
            ],
          ),
        ),
      ),
    );
  }
}