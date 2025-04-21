import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app_hive_v1/theme/theme_provider.dart';

class ToDoTile extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  final Function(bool?)? onChanged;
  final Function(BuildContext)? deleteFunction;

  ToDoTile({
    super.key, 
    required this.taskName, 
    required this.taskCompleted, 
    required this.onChanged,
    required this.deleteFunction,
  });

  @override
  Widget build(BuildContext context) {
    // Obtener el tema actual
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(), 
          children: [
            SlidableAction(
              onPressed: (context) => deleteFunction?.call(context),
              icon: Icons.delete,
              backgroundColor: themeProvider.currentTheme.checkboxTheme.side?.color ?? Colors.transparent,
              borderRadius: BorderRadius.circular(15),
            )
          ],
        ),
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: themeProvider.currentTheme.cardColor, // Usar el color de tarjeta del tema
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              // checkbox
              Checkbox(
                value: taskCompleted, // El valor del checkbox (marcado o no)
                onChanged: onChanged,
                activeColor: taskCompleted
                    ? themeProvider.currentTheme.scaffoldBackgroundColor // Color cuando está marcado
                    : themeProvider.currentTheme.colorScheme.secondary, // Color cuando NO está marcado
                checkColor: themeProvider.currentTheme.floatingActionButtonTheme.foregroundColor, // Color del ícono del checkbox (marca)
              ),
        
              // taskname
              Text(
                taskName,
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  decoration: taskCompleted
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                  color: themeProvider.currentTheme.textTheme.bodyLarge?.color, // Usar el color del texto según el tema
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
