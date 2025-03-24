import 'package:flutter/material.dart';
import 'package:notes_app/feature/home/widgets/task_item.dart';


import '../../../core/Models/task_maneger_model.dart';
import '../../../core/utils/style.dart';


class TasksListView extends StatefulWidget {
  const TasksListView({super.key});

  @override
  State<TasksListView> createState() => _TasksListViewState();
}

class _TasksListViewState extends State<TasksListView> {
  @override
  Widget build(BuildContext context) {


    return   ListenableBuilder(listenable: TaskManager.manager, builder: (context,child){
      return Expanded(
          child:TaskManager.manager.tasksList.isEmpty?  Center( // عرض Empty State
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
      ) :ListView.builder(
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
                  onDismissed:(direction){
                    if(direction==DismissDirection.startToEnd){
                      debugPrint("Completed");
                    }else{
                      TaskManager.manager.removeTask(index);

                    }
                  } ,
                  child: TaskItem(
                    task: TaskManager.manager.tasksList[index],
                  )),


              itemCount: TaskManager.manager.tasksList.length));
    });
  }
}