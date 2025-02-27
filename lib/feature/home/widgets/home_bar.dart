import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/utils/colors.dart';
import '../../../core/utils/style.dart';
import '../../../core/utils/text.dart';

class HomeBar extends StatelessWidget {
  const HomeBar({super.key});

  @override
  Widget build(BuildContext context) {
    return
       Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(AppText.yourName,style:
                    AppTextStyle.fontStyle20Bold.copyWith(
                        color:AppColors.primaryColor
                    ),),
                  SizedBox(
                    width: 8,
                  ),
                  Text(AppText.welcomeMessege,style: AppTextStyle.fontStyle20Bold.copyWith(
                      fontWeight: FontWeight.normal
                  ),),

                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  width: 80,
                  height: 60,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.indigo,

                  ),
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color:Colors.indigo,
                      image: DecorationImage(fit: BoxFit.contain,
                          image: Image.network("https://i.pinimg.com/736x/45/96/64/45966438cde0f80525ab77e7170e7647.jpg").image),
                    ),
                  ),
                ),
              ],
            ),
          ]


    );
  }
}
