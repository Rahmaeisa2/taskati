import 'package:flutter/material.dart';

class Task {
  String title;
  String note;
  DateTime date;
  TimeOfDay startTime;
  TimeOfDay endTime;
  Color color;

  Task({
    required this.title,
    required this.note,
    required this.date,
    required this.startTime,
    required this.endTime,
    required this.color,
  });
}
List<Task> defaultTasks = [
  Task(
    title: "Flutter Task - 1",
    note: "I will do this task",
    date: DateTime.now(),
    startTime: TimeOfDay(hour: 2, minute: 25),
    endTime: TimeOfDay(hour: 2, minute: 40),
    color: Colors.blue,
  ),
  Task(
    title: "Flutter Task - 2",
    note: "I will do this task",
    date: DateTime.now(),
    startTime: TimeOfDay(hour: 16, minute: 27),
    endTime: TimeOfDay(hour: 18, minute: 42),
    color: Colors.red,
  ),
  Task(
    title: "Flutter Task - 3",
    note: "I will do this task",
    date: DateTime.now(),
    startTime: TimeOfDay(hour: 19, minute: 27),
    endTime: TimeOfDay(hour: 21, minute: 43),
    color: Colors.orange,
  ),
  Task(
    title: "Flutter Task - 4",
    note: "I will do this task",
    date: DateTime.now(),
    startTime: TimeOfDay(hour: 3, minute: 27),
    endTime: TimeOfDay(hour: 5, minute: 43),
    color: Colors.blue,
  ),
];
