import 'package:hive_flutter/hive_flutter.dart';

class ToDoDataBase {

  List toDoList = [];

  // reff box
  final _myBox = Hive.box('mybox');

  // run this method for first time opening app ever
  void createInitialData() {
    toDoList =  [
      ["+ icon to create task", false],
      ["checkbox to mark as done", true],
      ["swipe right to delete task", false],
      ["trash deletes all done tasks", false]
    ];
  }

  // load data from db
  void loadData() {
    toDoList = _myBox.get("TODOLIST");
  }

  // update db
  void updateDataBase() {
    _myBox.put("TODOLIST", toDoList);
  }


}