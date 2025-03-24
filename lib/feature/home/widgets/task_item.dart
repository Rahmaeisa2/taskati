import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/utils/style.dart';
import '../../../core/Models/task_model.dart';

class TaskItem extends StatelessWidget {
  final TaskModel task;

  const TaskItem({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Color(task.color),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  task.title,
                  style: AppTextStyle.fontStyle20Bold.copyWith(color: Colors.white),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.access_time, color: Colors.white),
                    SizedBox(width: 10),
                    Text(
                      "${task.startTime} - ${task.endTime}",
                      style: AppTextStyle.fontStyle13Grey.copyWith(color: Colors.white),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Text(
                  task.note,
                  style: AppTextStyle.fontStyle17White,
                ),
              ],
            ),
          ),
          Container(width: .5, height: 80, color: Colors.white),
          SizedBox(width: 10),
          RotatedBox(
            quarterTurns: 3,
            child: Text(task.isComplated?"Complated" : "TO DO", style: AppTextStyle.fontStyle17White),
          ),
        ],
      ),
    );
  }
}
