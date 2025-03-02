import 'package:flutter/material.dart';
import 'package:notes_app/feature/home/widgets/add_and_date_btn.dart';
import 'package:notes_app/feature/home/widgets/date_container.dart';
import 'package:notes_app/feature/home/widgets/empty_task.dart';
import 'package:notes_app/feature/home/widgets/home_bar.dart';
import 'package:notes_app/feature/home/widgets/task_list.dart';

import '../add_task/add_task.dart';
import 'data/task.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),

            child: Column(
              children: [
                HomeBar(),
                SizedBox(
                  height: 20,
                ),
                DateAndAddBtn(),
                SizedBox(
                  height: 20,
                ),
                FilterDaysRow(),
                SizedBox(
                  height: 20,
                ),
                TasksListView(tasks: defaultTasks),
              ],
            ),
          ),
        ),

    );
  }
}