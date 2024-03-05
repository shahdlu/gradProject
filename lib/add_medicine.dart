
import 'package:flutter/material.dart';
import 'package:gradproj/CounterView%20.dart';
import 'package:gradproj/time.dart';

class Add_med extends StatelessWidget {
  const Add_med({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Color(0xff0861E7),
            height: 100,
            width: 400,
            child: Padding(
              padding: const EdgeInsets.only(left: 100, top: 30),
              child: Text("Add Medicine",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 150, left: 30),
            child: Text(
              "Pills name",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 150, left: 150),
            child: RotationTransition(
              turns: new AlwaysStoppedAnimation(15 / 360),
              child: new Image.asset(
                "images/capsule1.jpg",
                height: 37,
                width: 37,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 200, left: 20),
            child: Container(
              height: 45,
              width: 350,
              child: TextField(
                style: TextStyle(
                  color: const Color(0xff020202),
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 0.5,
                ),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Color.fromARGB(255, 255, 255, 255),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                  hintText: "Metformin",
                  hintStyle: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.5,
                      decorationThickness: 6),
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 1,
                    offset: Offset(0, 4), // changes position of shadow
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 330, left: 30),
            child: Text(
              "Dosage",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 330, left: 120),
            child: RotationTransition(
              turns: new AlwaysStoppedAnimation(15 / 360),
              child: new Image.asset(
                "images/capsule2.jpg",
                height: 37,
                width: 37,
              ),
            ),
          ),
          Container(
              padding: EdgeInsets.only(top: 320, left: 210),
              child: CounterScreen()),
          Padding(
            padding: const EdgeInsets.only(top: 480, left: 30),
            child: Text(
              "Time",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 480, left: 90),
            child: RotationTransition(
              turns: new AlwaysStoppedAnimation(15 / 360),
              child: new Image.asset(
                "images/timeicon.jpg",
                height: 37,
                width: 37,
              ),
            ),
          ),
          Container(
              padding: const EdgeInsets.only(top: 470, left: 200),
              child: HomePage()),
          Padding(
            padding: const EdgeInsets.only(top: 530, left: 220),
            child: Text(
              "add another time",
              style: TextStyle(
                color: Color(0xffE81717),
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 600, left: 20),
            child: ElevatedButton(
              onPressed: () {},
              child: Text(
                'Back',
                style: TextStyle(
                    color: const Color.fromARGB(255, 255, 255, 255),
                    fontSize: 25),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xff0861E7),
                minimumSize: Size(150, 60),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                  // <-- Radius
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 600, left: 220),
            child: ElevatedButton(
              onPressed: () {},
              child: Text(
                'Save',
                style: TextStyle(
                    color: const Color.fromARGB(255, 255, 255, 255),
                    fontSize: 25),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xff0861E7),
                minimumSize: Size(150, 60),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                  // <-- Radius
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
