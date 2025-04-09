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

  // checkbox on press
  void checkBoxChanged(bool? value, int index) {
    setState(() {
      toDoList[index][1] = !toDoList[index][1];
    });
  }

  // save new task
  void saveNewTask() {
    setState(() {
      toDoList.add([_controller.text, false]);
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
      },
    );
  }

  // delete task
  void deleteTask(int index) {
    setState(() {
      toDoList.removeAt(index);
    });
  }

  // delete all completed tasks
  void deleteCompleted() {
    setState(() {
      toDoList.removeWhere((task) => task[1] == true);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF00575E),
      appBar: AppBar(
        backgroundColor: const Color(0xFF48A6A7),
        title: Text(
          'To Do',
          style: TextStyle(
            fontFamily: 'Roboto',
            fontSize: 25,
            fontWeight: FontWeight.w900,
          ),
          ),
        centerTitle: true,
        elevation: 0,
      ),
      
      body: ListView.builder(
        itemCount: toDoList.length,
        itemBuilder: (context, index) {
          return ToDoTile(
            taskName: toDoList[index][0], 
            taskCompleted: toDoList[index][1], 
            onChanged: (value) => checkBoxChanged(value, index),
            deleteFunction: (context) => deleteTask(index),
          );
        },
      ),

      // Stack to overlay two FABs
      floatingActionButton: Stack(
        children: [
          // FAB to add a new task (Positioned to the left)
          Positioned(
            bottom: 10,
            right: 15,  
            child: FloatingActionButton(
              onPressed: createNewTask,
              backgroundColor: const Color(0xFF48A6A7),
              foregroundColor: Colors.white,
              child: const Icon(Icons.add),
            ),
          ),

          // FAB to delete all completed tasks (Positioned to the right)
          Positioned(
            bottom: 10,  
            left: MediaQuery.of(context).size.width * 0.1,  
            child: FloatingActionButton(
              onPressed: deleteCompleted,  
              backgroundColor: const Color.fromARGB(255, 1, 50, 56),
              foregroundColor: Colors.white,
              child: const Icon(Icons.delete_forever),
            ),
          ),
        ],
      ),
    );
  }
}
