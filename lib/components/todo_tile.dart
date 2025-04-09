import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoTile extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteFunction;

  ToDoTile({
    super.key, 
    required this.taskName, 
    required this.taskCompleted, 
    required this.onChanged,
    required this.deleteFunction,
  });


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(), 
          children: [
            SlidableAction(
              onPressed: (deleteFunction),
              icon: Icons.delete,
              backgroundColor: const Color.fromARGB(255, 1, 50, 56),
              borderRadius: BorderRadius.circular(15),
            )
          ],
        ),
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: const Color(0xFF9ACBD0),
            borderRadius: BorderRadius.circular(10),
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
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  decoration: taskCompleted
                  ? TextDecoration.lineThrough
                  : TextDecoration.none),
                ),
            ],
          ),
        ),
      ),
    );
  }
}