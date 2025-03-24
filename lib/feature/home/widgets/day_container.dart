import 'package:flutter/material.dart';
import 'package:notes_app/core/utils/colors.dart';

import '../../../core/utils/style.dart';



class DayContainer extends StatelessWidget {
  final bool isActive;
  const DayContainer({super.key, this.isActive = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      decoration: BoxDecoration(
        color: isActive ? AppColors.primaryColor : Colors.transparent,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Text(
            "oct",
            style: AppTextStyle.fontStyle17White.copyWith(
              color: isActive ? Colors.white : Colors.black,
            ),
          ),
          SizedBox(height: 10),
          Text(
            "30",
            style: AppTextStyle.fontStyle17White.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 25,
              color: isActive ? Colors.white : Colors.black,
            ),
          ),
          SizedBox(height: 10),
          Text(
            "MON",
            style: AppTextStyle.fontStyle17White.copyWith(
              color: isActive ? Colors.white : Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}