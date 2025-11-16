import 'package:flutter/material.dart';
import 'package:sanjaw/core/config/app_colors.dart';

class AppTheme {

   static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.amber,
    scaffoldBackgroundColor: Colors.white,
    fontFamily: 'Oswald-Regular',
    colorScheme: ColorScheme.light(
      primary:  Color(0xFFc9232f),
      secondary: Color(0xFFf5e108),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFFf5e108),
      foregroundColor: Color(0xFFc9232f),
      elevation: 0,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      selectedIconTheme: IconThemeData(
        color: AppColors.secondaryColor,
      ),
      unselectedIconTheme: IconThemeData(
        color: Colors.black, 
      ),
      selectedItemColor: AppColors.primaryColor,
      unselectedItemColor: Colors.black
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(fontSize: 16, color: Colors.black87),
      bodyMedium: TextStyle(fontSize: 14, color:Colors.black),
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
    fontFamily: 'Oswald-Regular',
    colorScheme: const ColorScheme.dark(
      primary: Colors.teal,
      secondary: Colors.orange,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.black,
      foregroundColor: Colors.amber,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.black,
      
      selectedIconTheme: IconThemeData(
        color: AppColors.primaryColor
      ),
      unselectedIconTheme: IconThemeData(
        color: AppColors.secondaryColor
      ),
      selectedItemColor: AppColors.primaryColor,
      unselectedItemColor: AppColors.secondaryColor
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(fontSize: 16, color: Colors.white),
      bodyMedium: TextStyle(fontSize: 14, color: Colors.white70),
    ),
   );
}