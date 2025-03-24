import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

import 'core/Models/task_model.dart';
import 'feature/splash/splash_screen.dart';
import 'package:path_provider/path_provider.dart';

void main() async{

 await Hive.initFlutter();
  Hive.registerAdapter(TaskModelAdapter( ));
  await Hive.openBox<TaskModel>("tasks");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,


      home: const SplashScreen(),
    );
  }
}


