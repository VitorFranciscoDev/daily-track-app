import 'package:daily_track/infrastructure/presentation/bottom_navigator/bottom_navigator.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BottomNavigatorScreen(),
    );
  }
}