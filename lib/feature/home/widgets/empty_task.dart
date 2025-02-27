import 'package:flutter/material.dart';

import '../../../core/utils/style.dart';


class EmptyTaskList extends StatelessWidget {
  const EmptyTaskList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset("assets/images/no yet.PNG",height: 300,width: 300,fit: BoxFit.contain,),
        Text("You do not have any task yet ",style: AppTextStyle.fontStyle17White.copyWith(
            color: Colors.grey
        ),)
      ],
    );
  }
}