import 'package:flutter/material.dart';

final lightTheme = ThemeData(
  brightness: Brightness.light,
  scaffoldBackgroundColor: Color(0xFF89A8B2),
  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xFFB3C8CF),
    foregroundColor: Color(0xFF3B484D),
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: Color.fromARGB(255, 104, 123, 131),
    foregroundColor: Color(0xFFF1F0E8),
  ),
  checkboxTheme: CheckboxThemeData(
    fillColor: WidgetStateProperty.all(Color(0xFFF1F0E8)),
    side: const BorderSide(color: Color(0xFFF1F0E8))
  ),
  cardColor: const Color(0xFFE5E1DA),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(color: Color(0xFF3B484D)),
  ),
);

final darkTheme = ThemeData(
  brightness: Brightness.dark,
  scaffoldBackgroundColor: const Color.fromARGB(255, 19, 19, 19),
  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xFF303030),
    foregroundColor: Colors.white,
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: Color.fromARGB(255, 255, 54, 54),
    foregroundColor: Colors.white,
  ),
  checkboxTheme: CheckboxThemeData(
    fillColor: WidgetStateProperty.all(const Color.fromARGB(255, 137, 145, 146)),
    side: const BorderSide(color: Color.fromARGB(255, 137, 145, 146))
  ),
  cardColor: const Color(0xFF2E2E2E),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(color: Colors.white),
  ),
);
