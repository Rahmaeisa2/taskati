import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notes_app/feature/home/widgets/task_item.dart';

import '../../../core/utils/colors.dart';
import '../../../core/utils/style.dart';
import '../data/task.dart';

class TasksListView extends StatefulWidget {
  final List<Task> tasks;
  const TasksListView({super.key, required this.tasks});
  @override
  State<TasksListView> createState() => _TasksListViewState();
}

class _TasksListViewState extends State<TasksListView> {
  List<Task> tasks = List.from(defaultTasks);
  @override
  void initState() {
    super.initState();
    tasks = widget.tasks;
  }
  Widget build(BuildContext context) {
    return Flexible(
      child: tasks.isEmpty
          ? Center( // عرض Empty State
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/no yet.PNG", width: 200),
            const SizedBox(height: 10),
            Text(
              "You do not have any tasks yet!\nAdd new tasks to make your days productive.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
          ],
        ),
      )
          : ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: tasks.length,
        itemBuilder: (context, index) => Dismissible(key: UniqueKey(),
            background: Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(12)
              ),
              child: Row(
                children: [
                  Icon(Icons.done,color: Colors.white,),
                  SizedBox(width: 10,),
                  Text("Completed",style: AppTextStyle.fontStyle17White,)
                ],
              ),
            ),
            secondaryBackground: Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(12)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text("Delete",style: AppTextStyle.fontStyle17White,),

                  SizedBox(width: 10,),
                  Icon(Icons.delete_outline_outlined,color: Colors.white,),
                ],
              ),
            ),
          onDismissed: (direction) {
            setState(() {
              tasks.removeAt(index) ;
            });

            if (tasks.isEmpty) {
              setState(() {});
            }

            if (direction == DismissDirection.startToEnd) {
              debugPrint("Completed");
            } else {
              debugPrint("Deleted");
            }
          },


          child: TaskItem(task: tasks[index]),

    ),
      ),
    );
  }
}
List<Color> colors = [
  AppColors.primaryColor,
  Colors.pink,
  Colors.lightBlueAccent,
];