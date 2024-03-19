

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gradproj/counter_trainings.dart';
import 'package:gradproj/reports.dart';
import 'package:gradproj/rest1.dart';
import 'package:gradproj/settings.dart';
import 'package:gradproj/vedio.dart';

import 'food.dart';
import 'homepage.dart';



class TimerTrainings extends StatefulWidget{
  @override
  State<TimerTrainings> createState() => _TimerTrainingsState();
}

class _TimerTrainingsState extends State<TimerTrainings> {
  int _currentIndex = 0;

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;

    });
    if(index == 0){
      Navigator.of(context).push(
          MaterialPageRoute(builder: (v)=> HomePageScreen())
      );
    }  else if(index == 1){
      Navigator.of(context).push(
          MaterialPageRoute(builder: (v)=> Reports())
      );
    } else if(index == 2){
      Navigator.of(context).push(
          MaterialPageRoute(builder: (v)=> Settings())
      );
    }
  }


  static const Duration countdownDuration = Duration(seconds: 30);
  Duration duration = Duration();
  Timer? timer;
  bool isCountdown = true;
  bool isButtonActivated = false;

  @override
  void initState(){
    super.initState();
    startTimer();
    reset();
  }
  void reset(){
    if(isCountdown){
      setState(() {
        duration = countdownDuration;
      });}else{
      setState(() {
        duration = Duration();
      });
    }
  }
  void addTime(){

    final addSeconds = isCountdown ? -1 :1;
    setState(() {
      final seconds = duration.inSeconds + addSeconds;
      if(seconds < 0){
        timer?.cancel();
        Navigator.of(context).push(
            MaterialPageRoute(builder: (v)=> Rest1())
        );
      }else {
        duration = Duration(seconds: seconds);
      }
    });

  }
  void startTimer(){
    timer = Timer.periodic(Duration(seconds: 1),(_) => addTime());
  }
  void stopTimer({bool resets = true}){
    if(resets){
      reset();
    }
    setState(() {
      timer?.cancel();
    });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Health Pulse',

      home: Scaffold(
        body: Container(

          child: _page(),
        ),
      ),

    );




  }

  Widget _timer(){
    String twoDigits(int n) => n.toString().padLeft(2,'0');
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));

    return Text('$minutes:$seconds',
      style: TextStyle(fontSize: 40,
          color: Colors.black,
          fontWeight: FontWeight.bold),
    );
  }
  Widget _page(){
    return Scaffold(
        bottomNavigationBar: Container(
          height: 56,
          padding: EdgeInsets.fromLTRB(30, 10, 30, 0),
          color: Colors.white,
          child: Row(
            children: [
              Padding(
                  padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                  child: GestureDetector(
                    onTap: (){
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (v)=> HomePageScreen())
                      );
                    },
                    child: Icon(
                      Icons.home,
                      size: 30,
                      color: Color.fromRGBO(145, 143, 143, 1.0),
                    ),
                  )),
              Padding(
                  padding: EdgeInsets.fromLTRB(110, 0, 20, 0),
                  child: GestureDetector(
                    onTap: (){
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (v)=> Reports())
                      );
                    },
                    child: Icon(

                      Icons.timeline,
                      size: 27,
                      color: Color.fromRGBO(145, 143, 143, 1.0),
                    ),
                  )),
              Padding(
                  padding: EdgeInsets.fromLTRB(90, 0, 0, 0),
                  child: GestureDetector(
                    onTap: (){
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (v)=> Settings())
                      );
                    },
                    child: Icon(

                      Icons.settings,
                      size: 27,
                      color: Color.fromRGBO(145, 143, 143, 1.0),
                    ),
                  )),
            ],
          ),
        ),
        body: Padding(
            padding: const EdgeInsets.fromLTRB(0,0,0,0),
            child: Column(
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        child: Padding(
                            padding: EdgeInsets.fromLTRB(20, 40, 0, 0),
                            child: Icon(
                              Icons.arrow_back_rounded,
                              //color: const Color.fromARGB(255, 255, 255, 255),
                              size: 25,
                            )),
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.fromLTRB(20, 40, 0, 0),
                        child: Text(
                          'Dynamic Chest',
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.only(top: 20, left: 30),
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(
                          Radius.circular(30),
                        ),
                        child: Image.asset(
                          'images/dynamic_chest_left.jpg',
                          alignment: Alignment.topCenter,
                          fit: BoxFit.cover,
                          width: 150,
                          height: 150,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 20, left: 30),
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(
                          Radius.circular(30),
                        ),
                        child: Image.asset(
                          'images/dynamic_chest_right.jpg',
                          alignment: Alignment.topCenter,
                          fit: BoxFit.cover,
                          width: 150,
                          height: 150,
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                    padding: EdgeInsets.only(top: 30),
                    height: 320,
                    width: 350,
                    child: VideoPlayerWidget()),
                Padding(padding: EdgeInsets.fromLTRB(10,0,0,0),
                  child: _timer(),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(75,0,0,0),
                  child: Row(
                    children: [
                      Padding(padding: EdgeInsets.fromLTRB(0,0,20,0),
                        child: GestureDetector(
                          child: Image.asset('images/left_triangle.png'),
                          onTap:  (){
                            Navigator.pop(context);
                          },
                        ),),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(fixedSize: Size.fromWidth(165),
                            backgroundColor: Color.fromRGBO(8, 97, 231, 1.0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            )),

                        onPressed: (){
                          if(timer!.isActive){
                            stopTimer(resets:false);
                          }else{
                            startTimer();
                          }
                        },
                        child: Row(
                          children: [
                            Icon(
                              timer!.isActive?   Icons.pause : Icons.play_arrow_rounded ,
                              color: Colors.white,
                              size: 30,
                            ),
                            Text(
                              timer!.isActive? 'Pause' : 'Resume',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(padding: EdgeInsets.fromLTRB(20,0,0,0)),
                      GestureDetector(
                        child: Image.asset('images/right_triangle.png'),
                        onTap:  (){
                          Navigator.of(context).push(
                              MaterialPageRoute(builder: (v)=> CounterTrainings())
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            )

        ));
  }
}