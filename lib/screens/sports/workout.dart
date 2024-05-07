import 'package:flutter/material.dart';
import 'package:gradproj/screens/main_screens/settings.dart';
import 'package:gradproj/screens/sports/timer_trainings.dart';
import 'package:gradproj/widgets/button.dart';
import 'package:gradproj/widgets/image.dart';
import 'package:gradproj/widgets/text.dart';

import '../../theme/constants.dart';
import '../main_screens/homepage.dart';
import '../reports/reports.dart';
import 'List_View1.dart';


class Workout extends StatefulWidget {
  const Workout({super.key});
  @override
  WorkoutScreenState createState() => WorkoutScreenState();
}

class WorkoutScreenState extends State<Workout> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
          body: TopImage(
            imagesrc: 'images/workout.jpg',
              title: 'Workouts',
              widget: Column(
              children: [
              Padding(
                padding:  EdgeInsets.fromLTRB(20,20,15,15 ),
              child: Row(
                children: [
                     SubTitle(
                      text: '8 Exercises . 4 Mins ',
                      textcolor: kButtonColor,
                      weight: FontWeight.bold
                    ),
                  Padding(
                      padding: const EdgeInsets.only( left: 10),
                      child: CalculateButton(
                        title: 'Start',
                        onTap: (){
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (v) => TimerTrainings(link: 'https://www.youtube.com/watch?v=ESJ6Ghvgr6k',))
                          );
                        }, 
                        buttonbackcolor: kButtonColor,
                        buttontextcolor: Colors.white,
                      )
                  ),
                ],
              )),
               SizedBox(height: 430,child: List1()),
    ])
         ));
  }

}