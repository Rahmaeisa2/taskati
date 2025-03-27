
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:notes_app/core/Models/task_model.dart';

class TaskManager extends ChangeNotifier{

  TaskManager._(){
    LoadTaskList();
  }
  static TaskManager manager=TaskManager._();

  List<TaskModel> tasksList=[

  ];
  LoadTaskList(){
    tasksList =  Hive.box<TaskModel>("tasks").values.toList();
  }


  void addTask(TaskModel task){
    tasksList.add(task);
    Hive.box<TaskModel>("tasks").add(task);

    notifyListeners();

  }
  void removeTask(index){

    tasksList.removeAt(index);
    Hive.box<TaskModel>("tasks").deleteAt(index);
    notifyListeners();
   // if (tasksList.isNotEmpty && tasksList[0] == "Default Task") {
   //   tasksList.removeAt(0);
  //  }
  }
  void complateTask(index){
    tasksList.remove(index);
    Hive.box<TaskModel>("tasks").deleteAt(index);

  }
  }
