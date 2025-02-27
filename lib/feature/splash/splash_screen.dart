import 'package:flutter/material.dart';
import 'package:notes_app/core/utils/images.dart';
import 'package:notes_app/core/utils/style.dart';
import 'package:notes_app/core/utils/text.dart';
import 'package:notes_app/feature/home/home.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
 void initState(){
    Future.delayed(Duration(seconds: 3),() {
      Navigator.push(context,
          MaterialPageRoute(builder: (BuildContext context) => HomeScreen()));
    }
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Image.asset(images.splashImage,

                alignment: Alignment.center,
              ),
            SizedBox(
              height: 10,
            ),

            Text(AppText.AppName,
                style:AppTextStyle.fontStyle20Bold,),
            SizedBox(
              height: 7,
            ),

            Text(AppText.description,
                style: AppTextStyle.fontStyle13Grey
            ),
          ]
        ),
      ),
    );
  }
}
