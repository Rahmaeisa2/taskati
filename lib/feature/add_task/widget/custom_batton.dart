import 'package:flutter/material.dart';
import 'package:notes_app/core/utils/colors.dart';
import 'package:notes_app/core/utils/style.dart';
class CustomButton extends StatelessWidget {
  final String title ;
  final IconData? icon;
  final void Function()? onTap;
  const CustomButton ({super.key,  this.icon, required this.title, required this.onTap});


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 12,
        ),
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if(icon!=null)
              Icon(icon, color: Colors.white,size: 16,),
          Text(
                title , style:
              AppTextStyle.fontStyle17White,),
          ],
        ),
      ),
    );
  }
}
