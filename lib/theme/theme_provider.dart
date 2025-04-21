import 'package:flutter/material.dart';
import 'theme.dart';

class ThemeProvider extends ChangeNotifier {
  bool _isDarkMode = false;

  bool get isDarkMode => _isDarkMode;

  void toggleTheme() {
    _isDarkMode = !_isDarkMode;
    notifyListeners(); // Notifica a la UI para que se actualice cuando se cambie el tema
  }

  ThemeData get currentTheme => _isDarkMode ? darkTheme : lightTheme;
}
