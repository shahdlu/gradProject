import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gradproj/settings.dart';

import 'homepage.dart';



class Report extends StatefulWidget{
  @override
  State<Report> createState() => _ReportState();
}
class _ReportState extends State<Report> {

  final items=['30','40','50','60'];
  int index=0;

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
    return  MaterialApp(
      title: 'Health Pulse',

      home: Scaffold(
        appBar: AppBar(
            automaticallyImplyLeading: false,
          title: Padding( padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
          child: Text(
          'Report',
            style: TextStyle(fontWeight: FontWeight.bold),
        ))),
        body: Column(
          children: [

            Divider(
              thickness: 2.7,
              indent: 45,
              endIndent: 90,
              color: Color.fromRGBO(8, 97, 231, 1.0),


            ),
            Padding(
                padding: EdgeInsets.fromLTRB(30, 30, 0, 30),
               child: Row(
              children: [
                Text("For exercises",
                  style: TextStyle(fontWeight: FontWeight.bold,
                    fontSize: 20,),),
                Padding(padding: EdgeInsets.fromLTRB(8, 0, 0, 0),
                child: Icon(Icons.directions_bike_sharp,
                size: 40,
                )
                ),

              ],)
            ),
            Row(
              children: [
                Padding(padding: EdgeInsets.fromLTRB(30, 0, 0, 0)),
                Text("Workouts",
                  style: TextStyle(fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Color.fromRGBO(8, 97, 231, 1.0)),),
                Padding(padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                child: Icon(Icons.sports_gymnastics,
                  size: 40,
                  color: Color.fromRGBO(8, 97, 231, 1.0),
                )),
                Padding(padding: EdgeInsets.fromLTRB(120, 0, 0, 0),
                child: Text("8",
                  style: TextStyle(fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Color.fromRGBO(8, 97, 231, 1.0)),),)
              ],
            ),
            Row(
              children: [
                Padding(padding: EdgeInsets.fromLTRB(30, 70, 0, 0)),
                Text("Calories",
                  style: TextStyle(fontWeight: FontWeight.bold,
                      fontSize: 20,color: Color.fromRGBO(8, 97, 231, 1.0)),),
                Padding(padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                child: Icon(Icons.water_drop_rounded,
                  size: 30,
                  color: Color.fromRGBO(8, 97, 231, 1.0),
                )),
                Padding(padding: EdgeInsets.fromLTRB(90, 70, 0, 0)),
                Text("44.8 Kcal",
                  style: TextStyle(fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Color.fromRGBO(8, 97, 231, 1.0)),),
              ],
            ),
            Row(
              children: [
                Padding(padding: EdgeInsets.fromLTRB(30, 70, 0, 0)),
                Text("Time",
                  style: TextStyle(fontWeight: FontWeight.bold,
                      fontSize: 20,color: Color.fromRGBO(8, 97, 231, 1.0)),),
                Padding(padding: EdgeInsets.fromLTRB(52, 0, 0, 0),
                child: Icon(Icons.access_time_outlined,
                  size: 30,
                  color: Color.fromRGBO(8, 97, 231, 1.0),
                )),
                Padding(padding: EdgeInsets.fromLTRB(100, 0, 0, 0),
               child: Text("4 Mins",
                  style: TextStyle(fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Color.fromRGBO(8, 97, 231, 1.0)),),)
              ],
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(30, 20, 0, 30),
           child:  Row(
              children: [

                Text("For Food",
                  style: TextStyle(fontWeight: FontWeight.bold,
                    fontSize: 20,),),
                Padding(
                  padding: EdgeInsets.fromLTRB(8, 0, 0, 0),
                child: Icon(Icons.local_dining,
                  size: 35,
                )),

              ],
            )),
            Row(
              children: [
                Padding(padding: EdgeInsets.fromLTRB(30, 70, 0, 0)),
                Text("Meals",
                  style: TextStyle(fontWeight: FontWeight.bold,
                      fontSize: 20,color: Color.fromRGBO(8, 97, 231, 1.0)),),
                Padding(padding: EdgeInsets.fromLTRB(35, 0, 0, 0),
                child: Icon(Icons.ramen_dining_sharp,
                  size: 35,
                  color: Color.fromRGBO(8, 97, 231, 1.0),
                )),
                Padding(padding: EdgeInsets.fromLTRB(150, 0, 0, 0),
                child: Text("3",
                  style: TextStyle(fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Color.fromRGBO(8, 97, 231, 1.0)),),)
              ],
            ),
            Row(
              children: [
                Padding(padding: EdgeInsets.fromLTRB(30, 70, 0, 0)),
                Text("Calories",
                  style: TextStyle(fontWeight: FontWeight.bold,
                      fontSize: 20,color: Color.fromRGBO(8, 97, 231, 1.0)),),
                Padding(padding: EdgeInsets.fromLTRB(5, 0, 0, 0)),
                Icon(Icons.apple,
                  size: 40,
                  color: Color.fromRGBO(8, 97, 231, 1.0),
                ),
                Padding(padding: EdgeInsets.fromLTRB(90, 70, 0, 0)),
                Text("1120 Kcal",
                  style: TextStyle(fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Color.fromRGBO(8, 97, 231, 1.0)),),
              ],
            ),

          ],
        ),

          bottomNavigationBar: Container(
            height: 56,
            padding: EdgeInsets.fromLTRB(10, 10, 30, 0),
            color: Colors.white,
            child: Row(
              children: [
                Padding(
                    padding: EdgeInsets.fromLTRB(30, 0, 15, 0),
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

                        ))
                ),
                Padding(
                    padding: EdgeInsets.fromLTRB(50,0,0,0),
                child: GestureDetector(
                    onTap: (){
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (v)=> Report())
                      );
                    },
                    child: Container(
                        padding: EdgeInsets.fromLTRB(0,0,15,0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(25)),
                          color: Color.fromRGBO(8, 97, 231, 0.14901960784313725),
                        ),
                        //color: Color.fromRGBO(8, 97, 231, 0.14901960784313725),
                        child: Row(
                          children: [
                            IconButton(
                                onPressed: (){},
                                icon: Icon(
                              Icons.timeline,
                              size: 27,
                              color: Color.fromRGBO(8, 97, 231, 1.0),
                            )),
                            Text(
                              'Progress',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromRGBO(8, 97, 231, 1.0)
                              ),
                            ),
                          ],
                        )))
                ),
                Padding(
                    padding: EdgeInsets.fromLTRB(55,0,0,0),
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
      ),
    );
  }
}