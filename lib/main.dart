//import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gradproj/screens/data&bmr&bmi/datascreen.dart';
import 'package:gradproj/screens/diabetes_info/some_information.dart';
import 'package:gradproj/screens/foodpart/food.dart';
import 'package:gradproj/screens/foodpart/meals.dart';
import 'package:gradproj/screens/foodpart/search_field.dart';
import 'package:gradproj/screens/foodpart/selectedItems.dart';
import 'package:gradproj/screens/main_screens/homepage.dart';
import 'package:gradproj/screens/main_screens/mainscreen.dart';
import 'package:gradproj/screens/main_screens/settings.dart';
import 'package:gradproj/screens/medicaltests/MedicalTests.dart';
import 'package:gradproj/screens/medicine/add_medicine.dart';
import 'package:gradproj/screens/medicine/medicine1.dart';
import 'package:gradproj/screens/reports/reports.dart';
import 'package:gradproj/screens/sports/counter_trainings.dart';
import 'package:gradproj/screens/sports/rest.dart';
import 'package:gradproj/screens/sports/sports.dart';
import 'package:gradproj/screens/sports/timer_trainings.dart';
import 'package:gradproj/screens/welcome&login/login.dart';
import 'package:gradproj/screens/welcome&login/welcome.dart';
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
