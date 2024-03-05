import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gradproj/report.dart';
import 'package:gradproj/rest1.dart';
import 'package:gradproj/rest2.dart';
import 'package:gradproj/settings.dart';
import 'package:gradproj/timer_trainings.dart';
import 'package:gradproj/vedio.dart';
import 'package:video_player/video_player.dart';

import 'food.dart';
import 'homepage.dart';



class CounterTrainings extends StatefulWidget{
  @override
  State<CounterTrainings> createState() => _CounterTrainingsState();
}

class _CounterTrainingsState extends State<CounterTrainings> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;
  int _currentIndex = 0;

  @override
  void initState() {

    // Initialize the video player controller
    _controller = VideoPlayerController.network('https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4');
    _initializeVideoPlayerFuture = _controller.initialize();
    _controller.setLooping(true);
    _controller.setVolume(1.0);
    super.initState();
  }

  @override
  void dispose() {
    // Dispose of the video player controller when the widget is disposed
    _controller.dispose();
    super.dispose();
  }

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
          MaterialPageRoute(builder: (v)=> Report())
      );
    } else if(index == 2){
      Navigator.of(context).push(
          MaterialPageRoute(builder: (v)=> Settings())
      );
    }
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
                          MaterialPageRoute(builder: (v)=> Report())
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
                          'Incline Push-Ups',
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
                          'images/Incline Push-Ups_left.jpg',
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
                          'images/Incline Push-Ups_right.jpg',
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
                  child: Text(
                    'X6',
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(75,50,0,0),
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
                          Navigator.of(context).push(
                              MaterialPageRoute(builder: (v)=> Rest2())
                          );
                        },
                           child: Text(
                               'Done' ,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),

                      ),
                      Padding(padding: EdgeInsets.fromLTRB(20,0,0,0)),
                      GestureDetector(
                        child: Image.asset('images/right_triangle.png'),
                        onTap:  (){
                          Navigator.of(context).push(
                              MaterialPageRoute(builder: (v)=> TimerTrainings())
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

  Widget _video_player(){
    return Scaffold(
      body: FutureBuilder(
        future: _initializeVideoPlayerFuture,
        builder: (context,snapshot){
          if(snapshot.connectionState == ConnectionState.done){
            return AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: Padding(
                    padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: VideoPlayer(
                        _controller,
                      ),
                    )));
          }else{
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },


      ),

      floatingActionButton:
      Padding(
          padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
          child: FloatingActionButton(
            onPressed: () {
              setState(() {
                if(_controller.value.isPlaying){
                  _controller.pause();
                }else{
                  _controller.play();
                }
              });
            },
            child: Icon(_controller.value.isPlaying ? Icons.pause : Icons.play_arrow),
          )),
    );
  }
}
