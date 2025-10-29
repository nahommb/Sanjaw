import 'package:flutter/material.dart';
import 'package:sanjaw/core/config/app_theme.dart';
import 'package:sanjaw/features/home/presentation/screens/home_screen.dart';
import 'package:sanjaw/features/main/presentation/main_screen.dart';
import 'package:sanjaw/features/players/presentation/screens/players_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sanjaw',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      routes: {
        PlayersScreen.routeName: (context) =>PlayersScreen(),
      },
      home: const MainScreen()
    );
  }
}