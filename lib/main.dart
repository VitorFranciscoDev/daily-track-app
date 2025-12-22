import 'package:daily_track/infrastructure/presentation/app.dart';
import 'package:daily_track/infrastructure/presentation/bottom_navigator/bottom_navigator_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => BottomNavigatorProvider()),
      ],
      child: const MyApp(),
    ),
  );
}