import 'package:flutter/material.dart';

class ToDoTile extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  Function(bool?)? onChanged;

  ToDoTile({
    super.key, 
    required this.taskName, 
    required this.taskCompleted, 
    required this.onChanged,
  });


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25, top: 25),
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: const Color(0xFF9ACBD0),
          borderRadius: BorderRadius.circular(15),
          ),
        child: Row(
          children: [
            // checkbox
            Checkbox(
              value: taskCompleted, 
              onChanged: onChanged,
              activeColor: const Color.fromARGB(255, 1, 50, 56),
              ),

            // taskname
            Text(
              taskName,
              style: TextStyle(decoration: taskCompleted
              ? TextDecoration.lineThrough
              : TextDecoration.none),
              ),
          ],
        ),
      ),
    );
  }
}