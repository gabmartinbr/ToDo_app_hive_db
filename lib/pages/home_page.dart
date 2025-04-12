import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:to_do_app_hive_v1/components/dialog_box.dart';
import 'package:to_do_app_hive_v1/components/todo_tile.dart';
import 'package:to_do_app_hive_v1/db/db.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // reff the hive box
  final _myBox = Hive.box('mybox');
  ToDoDataBase db = ToDoDataBase();

  @override
  void initState() {
    // if first time ever open, create default data
    if (_myBox.get("TODOLIST") == null) {
      db.createInitialData();
    } else {
      db.loadData();
    }
    super.initState();
    
  }

  // text controller
  final _controller = TextEditingController();

  // checkbox on press
  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
    });
    db.updateDataBase();
  }

  // save new task
  void saveNewTask() {
    setState(() {
      db.toDoList.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    db.updateDataBase();
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
    db.updateDataBase();
  }

  // delete task
  void deleteTask(int index) {
    setState(() {
      db.toDoList.removeAt(index);
    });
    db.updateDataBase();
  }

  // delete all completed tasks
  void deleteCompleted() {
    setState(() {
      db.toDoList.removeWhere((task) => task[1] == true);
    });
    db.updateDataBase();
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
        itemCount: db.toDoList.length + 1, // +1 para agregar un espacio al final
        itemBuilder: (context, index) {
          if (index < db.toDoList.length) {
            return ToDoTile(
              taskName: db.toDoList[index][0], 
              taskCompleted: db.toDoList[index][1], 
              onChanged: (value) => checkBoxChanged(value, index),
              deleteFunction: (context) => deleteTask(index),
            );
          } else {
            // Espacio final
            return const SizedBox(height: 100);
          }
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
