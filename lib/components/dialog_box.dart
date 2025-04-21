import 'package:flutter/material.dart';
import 'package:to_do_app_hive_v1/components/my_button.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app_hive_v1/theme/theme_provider.dart';

class DialogBox extends StatelessWidget {
  final controller;
  final VoidCallback onSave;
  final VoidCallback onCancel;

  DialogBox({
    super.key, 
    required this.controller, 
    required this.onSave, 
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return AlertDialog(
      backgroundColor: themeProvider.currentTheme.cardColor,  // Usar color del tema para el fondo del dialogo
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10), // Esquinas redondeadas
      ),
      content: Container(
        height: 130,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // Obtener el input del usuario
            TextField(
              controller: controller,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: themeProvider.currentTheme.checkboxTheme.fillColor?.resolve({}) ?? Colors.teal,  // Usar un valor predeterminado en caso de que sea null
                    width: 2,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: themeProvider.currentTheme.colorScheme.secondary, // Color cuando tiene foco
                    width: 2.5,
                  ),
                ),
                hintText: "Add a new task",
                hintStyle: TextStyle(
                  color: themeProvider.currentTheme.textTheme.bodyLarge?.color, // Usar color de texto del tema
                ),
              ),
            ),
            const SizedBox(height: 10), // Espacio vertical
            // Botones de guardar y cancelar
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // Botón de guardar
                Expanded(
                  child: MyButton(
                    text: "Save", 
                    onPressed: onSave, 
                    buttonColor: themeProvider.currentTheme.floatingActionButtonTheme.backgroundColor!, // Color de fondo del botón
                    textColor: themeProvider.currentTheme.floatingActionButtonTheme.foregroundColor!, // Color del texto del botón
                  ),
                ),
                const SizedBox(width: 20),
                // Botón de cancelar
                Expanded(
                  child: MyButton(
                    text: "Cancel", 
                    onPressed: () {
                      controller.clear();  // Limpiar el texto del controlador
                      onCancel();           // Llamar al método onCancel
                    },
                    buttonColor: themeProvider.currentTheme.floatingActionButtonTheme.backgroundColor!, // Color de fondo del botón
                    textColor: themeProvider.currentTheme.floatingActionButtonTheme.foregroundColor!, // Color del texto del botón
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
