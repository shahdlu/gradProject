

import 'package:flutter/material.dart';

class Reports extends StatefulWidget {
  @override
  _ReportsState createState() => _ReportsState();
}

class _ReportsState extends State<Reports> {
  int _currentIndex=0;
  List<String> items=['Sports','Food','Medicine','Medical Tests'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        //automaticallyImplyLeading: false,
        title: Text(
        'Reports',
        style: TextStyle(fontWeight: FontWeight.bold),
    ),

    ),
      body: ListView.builder(
          itemCount: 4,
          itemBuilder: (context,index){
            _currentIndex = index;
            return Padding(
                padding: EdgeInsets.fromLTRB(20, 20, 30, 0),
              child: GestureDetector(
              onTap: (){
                // if(index == 0 ){
                //   Navigator.of(context).push(
                //       MaterialPageRoute(builder: (v)=> SportsReport()))
                // }else if(index == 1 ){
                //   Navigator.of(context).push(
                //       MaterialPageRoute(builder: (v)=> FoodReport()))
                // }else if(index == 2 ){
                //   Navigator.of(context).push(
                //       MaterialPageRoute(builder: (v)=> MedicineReport()))
                // }else if(index == 3 ){
                //   Navigator.of(context).push(
                //       MaterialPageRoute(builder: (v)=> MedicalTestsReport()))
                // }
              },
            child: Container(
            height: 80,
            decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Color(0xFFFBFDFF),
            boxShadow: [
            BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3), // changes position of shadow
            ),
            ],

            ),
            child: Padding(
              padding: EdgeInsets.fromLTRB(50, 15, 0, 15),
            child: Text(
              items[_currentIndex],
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            ),
            ),)
            );
          }
      ),



    );
  }
}
