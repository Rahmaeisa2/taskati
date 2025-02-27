import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../core/utils/colors.dart';
import '../../../core/utils/style.dart';

class DateAndAddBtn extends StatelessWidget {
  const DateAndAddBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            DateFormat.yMMMMd().format(DateTime.now()),
            style: AppTextStyle.fontStyle20Bold,
          ),
        ),

         Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Row(
              children: [
                Icon(Icons.add, color: Colors.white, size: 18),
                SizedBox(width: 5),
                Text('Add Task',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 19
                ),),
              ],
            ),
          ),

      ],
    );
  }
}
