//import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:gradproj/LosingWeight.dart';
import 'package:gradproj/counter_trainings.dart';
import 'package:gradproj/food.dart';
import 'package:gradproj/login.dart';
import 'package:gradproj/medicine.dart';
import 'package:gradproj/report.dart';
import 'package:gradproj/rest1.dart';
import 'package:gradproj/rest2.dart';
import 'package:gradproj/screens/home.dart';
import 'package:gradproj/settings.dart';
import 'package:gradproj/timer_trainings.dart';
import 'package:gradproj/vedio.dart';
import 'package:gradproj/welcome.dart';

import 'Container.dart';
import 'breakfast.dart';
import 'build_body.dart';
import 'home_next_page.dart';
import 'homepage.dart';
import 'list_view.dart';

//import 'firebase_options.dart';
//import 'login.dart';


/*Future */main() /*async*/async {
 /* WidgetsFlutterBinding.ensureInitialized();
  await Future.delayed(const Duration(seconds: 3));
  FlutterNativeSplash.remove();*/
  WidgetsFlutterBinding.ensureInitialized();
 /* await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,);*/
  runApp(MyApp());
  
}
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      title: 'Health Pulse',
      theme: ThemeData(
        primarySwatch: Colors.blue,

      ),
      home: Welcome(),



    );
    
  }
  
  
}
