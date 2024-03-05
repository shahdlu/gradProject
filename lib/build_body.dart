import 'package:flutter/material.dart';
import 'package:gradproj/counter_trainings.dart';
import 'package:gradproj/report.dart';
import 'package:gradproj/rest2.dart';
import 'package:gradproj/settings.dart';

import 'List_View1.dart';
import 'homepage.dart';
import 'list_view.dart';
int _currentIndex  = 0;



class Build extends StatefulWidget {
  const Build({super.key});
  @override
  _BuildScreenState createState() => _BuildScreenState();
}

class _BuildScreenState extends State<Build> {
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
        child: Column(
          children: [
            Container(
              width: 500,
              height: 245,
              child: Stack(
                children: [
                  Container(
                    //width: 400,
                    //height: 230,
                    child: Container(
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30),
                        ),
                        child: Image.asset(
                          'images/build_bodyimg.jpg',
                          alignment: Alignment.topCenter,
                          fit: BoxFit.cover,
                          width: 400,
                          height: 350,
                        ),
                      ),
                    ),
                  ),
                  Container(
                      //alignment: Alignment.centerLeft,
                      padding: EdgeInsets.only(left: 20, top: 60),
                      child: Text(
                        'Build a fit body',
                        style: TextStyle(
                           /* shadows: <Shadow>[
                              Shadow(
                                offset: Offset(3.0, 4.0),
                                blurRadius: 4.0,
                                color: Color.fromARGB(255, 77, 75, 75),
                              ),
                            ],*/
                            color: const Color.fromARGB(255, 255, 255, 255),
                            fontWeight: FontWeight.bold,
                            fontSize: 25.0),
                      )),
                  Container(
                      padding: EdgeInsets.only(left: 20, top: 190),
                      child: Text(
                        'You can , just start',
                        style: TextStyle(
                            color: const Color.fromARGB(255, 255, 255, 255),
                            fontWeight: FontWeight.bold,
                            fontSize: 17.0),
                      )),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      padding: EdgeInsets.only(left: 10, top: 35,bottom: 10),
                      child: Icon(
                        Icons.arrow_back_rounded,
                        color: const Color.fromARGB(255, 255, 255, 255),
                        size: 25,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
                  // margin: EdgeInsets.symmetric(vertical: 30, horizontal: 40),
                  margin:
                      EdgeInsets.only(top: 1, bottom: 1, right: 20, left: 20),
                  child: const Text(
                    '8 Exercises . 4 Mins ',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Color(0xff0861e7),
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                      height: 1,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 30, 20, 0),
                  child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (v)=> CounterTrainings())
                    );
                  },
                  child: Text('Start'),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.only(left: 20, right: 20),

                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12), // <-- Radius
                    ),

                    textStyle: TextStyle(
                      decorationThickness: 2,
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),

                    primary: Color(0xff0861E7), // background
                    onPrimary: Colors.white, // foreground
                  ),
                )),
              ],
            ),
            Expanded(child: List2()),
          ],
        ),
      ),
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
            )
    ));
  }
}
