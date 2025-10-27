import 'package:flutter/material.dart';

class AppTheme {

   static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.amber,
    scaffoldBackgroundColor: Colors.white,
    colorScheme: ColorScheme.light(
      primary:  Color.fromARGB(255, 187, 38, 38),
      secondary: Colors.amber,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.amber,
      foregroundColor: Color.fromARGB(255, 187, 38, 38),
      elevation: 0,
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(fontSize: 16, color: Colors.black87),
      bodyMedium: TextStyle(fontSize: 14, color: Colors.black54),
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    ),

   );
   static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.amber,
        scaffoldBackgroundColor: const Color(0xFF121212),
    colorScheme: const ColorScheme.dark(
      primary: Colors.teal,
      secondary: Colors.orange,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.black,
      foregroundColor: Colors.amber,
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(fontSize: 16, color: Colors.white),
      bodyMedium: TextStyle(fontSize: 14, color: Colors.white70),
    ),
   );
}