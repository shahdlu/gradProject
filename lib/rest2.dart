import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gradproj/rest1.dart';
import 'package:gradproj/settings.dart';


class Rest2 extends StatefulWidget{
  @override
  State<Rest2> createState() => _Rest2State();
}
class _Rest2State extends State<Rest2> {
   static const Duration countdownDuration = Duration(seconds: 30);
  Duration duration = Duration();
  Timer? timer;
  bool isCountdown = true;
  bool isButtonActive = true;

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
      }else {
        duration = Duration(seconds: seconds);
      }});

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
          backgroundColor: Color.fromRGBO(8, 97, 231, 1.0) ,
          body: Container(

            child: _page(),
          ),
        ));
  }
  Widget _timer(){
       String twoDigits(int n) => n.toString().padLeft(2,'0');
       final minutes = twoDigits(duration.inMinutes.remainder(60));
       final seconds = twoDigits(duration.inSeconds.remainder(60));

       return Text('$minutes:$seconds',
      style: TextStyle(fontSize: 40,
      color: Colors.white,
      fontWeight: FontWeight.bold),
    );
  }
    Widget _page(){
    return  Padding(
      padding: const EdgeInsets.fromLTRB(0,0,0,0),
        child: Center(
        child: Column(
            children: [
               ClipRRect(
                  borderRadius:  BorderRadius.only(bottomLeft: Radius.circular(35),bottomRight: Radius.circular(35)),
                  child: Image.asset('images/rest2png.png')),
              Padding(padding: EdgeInsets.fromLTRB(0, 100, 0, 0)),
              Text(
                "Rest",
                style: TextStyle(fontSize: 35,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),

              ),
              Padding(padding: EdgeInsets.fromLTRB(0, 15, 0, 0)),

              _timer(),
              Padding(padding: EdgeInsets.fromLTRB(0, 80, 0, 0)),
              ElevatedButton(

                  onPressed: (){
                    Navigator.pop(context);

                  },
                child: const SizedBox(
                    width: 120,
                    height: 40,
                    child: Text(
                      "Skip",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20,
                          color: Color.fromRGBO(8, 97, 231, 1.0)),
                    )),

                 style: ElevatedButton.styleFrom(
                     shape: RoundedRectangleBorder(
                       borderRadius: BorderRadius.circular(15),
                     ),
             onPrimary: Colors.white),

              ),
              Padding(padding: EdgeInsets.fromLTRB(0, 15, 0, 0)),
              ElevatedButton(
                onPressed: isButtonActive ?
                    (){
                  setState(() {

                    isButtonActive = false;
                  });

                } : null,

                child: const SizedBox(
                  width: 120,
                  height: 40,
                  child: Text(
                    "+20s",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20,
                        color: Color.fromRGBO(8, 97, 231, 1.0)

                    ),

                  ),
                ),
                style: ElevatedButton.styleFrom(
                    onSurface: Color.fromRGBO(255, 255, 255, 1.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    onPrimary: Colors.white),
              ),
            ],
      ),),
    );
    }


}