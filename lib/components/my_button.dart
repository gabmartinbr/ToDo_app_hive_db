import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app_hive_v1/theme/theme_provider.dart';

class MyButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  MyButton({
    super.key, 
    required this.text, 
    required this.onPressed, 
    required Color textColor, 
    required Color buttonColor, 
  });

  @override
  Widget build(BuildContext context) {
    // Obtener el tema actual
    final themeProvider = Provider.of<ThemeProvider>(context);

    return MaterialButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      onPressed: onPressed,
      color: themeProvider.currentTheme.floatingActionButtonTheme.backgroundColor, // Color de fondo del tema
      textColor: themeProvider.currentTheme.floatingActionButtonTheme.foregroundColor, // Color del texto según el tema
      elevation: 0, // No hay sombra
      child: Text(text),
    );
  }
}
