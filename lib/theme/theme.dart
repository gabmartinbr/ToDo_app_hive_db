import 'package:flutter/material.dart';

final lightTheme = ThemeData(
  brightness: Brightness.light,
  scaffoldBackgroundColor: const Color(0xFF00575E),
  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xFF48A6A7),
    foregroundColor: Colors.white,
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: Color(0xFF48A6A7),
    foregroundColor: Colors.white,
  ),
  checkboxTheme: CheckboxThemeData(
    fillColor: WidgetStateProperty.all(const Color(0xFF48A6A7)),
    side: const BorderSide(color: const Color(0xFF48A6A7)), // Establecer el borde como blanco
  ),
  cardColor: const Color.fromARGB(255, 142, 199, 206),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(color: Color.fromARGB(255, 34, 34, 34)),
  ),
  colorScheme: ColorScheme.fromSwatch().copyWith(
    secondary: Colors.teal,
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
    backgroundColor: Color(0xFF444444),
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
