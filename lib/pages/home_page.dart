import 'package:flutter/material.dart';
import 'package:to_do_app_hive_v1/components/dialog_box.dart';
import 'package:to_do_app_hive_v1/components/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  // text controller
  final _controller = TextEditingController();

  // list of todo tasks
  List toDoList = [
    ["Task 1", false],
    ["Task 2", true],
  ];

  // checkbox onpress
  void checkBoxChanged(bool? value, int index) {
    setState(() {
      toDoList[index][1] = !toDoList[index][1];
    });
  }

  // save new task
  void saveNewTask() {
    setState(() {
      toDoList.add([ _controller.text, false ]);
      _controller.clear();
    });
    Navigator.of(context).pop();
  }

  // create new task
  void createNewTask() {
    showDialog(
      context: context, 
      builder: (context) {
        return DialogBox(
          controller: _controller,
          onSave: saveNewTask,
          onCancel: () => Navigator.of(context).pop(),

        );
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF00575E),
      appBar: AppBar(
        backgroundColor: const Color(0xFF48A6A7),
        title: Text('To Do'),
        centerTitle: true,
        elevation: 0,
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        backgroundColor: Color(0xFF48A6A7), // Color de fondo (tu color personalizado)
        foregroundColor: Colors.white,     // Color del ícono
        child:
          const Icon(Icons.add),
      ),

      body: ListView.builder(
        itemCount: toDoList.length,
        itemBuilder: (context, index) {
          return ToDoTile(
            taskName: toDoList[index][0], 
            taskCompleted: toDoList[index][1], 
            onChanged: (value) => checkBoxChanged(value, index),
          );
        },
      )
    );
  }
}