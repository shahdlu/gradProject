import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'A1C.dart';
import 'Time1.dart';


class A1cPLUS extends StatefulWidget {
  const A1cPLUS({super.key});

  @override
  State<A1cPLUS> createState() => _A1cPLUSState();
}

class _A1cPLUSState extends State<A1cPLUS> {
  final dfController = TextEditingController();
  void _presentDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2000),
            lastDate: DateTime(2100))
        .then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        dfController.text = DateFormat.yMd().format(pickedDate);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Color(0xff0861E7),
            height: 100,
            width: 400,
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => A1c(),
                    ));
                  },
                  child: Container(
                    padding: EdgeInsets.only(left: 20, top: 20),
                    child: Icon(
                      Icons.arrow_back_rounded,
                      color: const Color.fromARGB(255, 255, 255, 255),
                      size: 30,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 120, top: 20),
                  child: Text("A1C",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      )),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 150, left: 30),
            child: Text(
              "Aerage Sugar Concentration",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
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
                  hintText:
                      "\t \t \t \t \t \t \t \t \t \t \t \t \t \t \t \t \t \t \t \t \t \t \t \t \t \t \  %",
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
            padding: const EdgeInsets.only(top: 335, left: 30),
            child: Text(
              "Date",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 335, left: 90),

            //turns: new AlwaysStoppedAnimation(15 / 360),
            child: new Image.asset(
              "images/dateimg.jpg",
              height: 32,
              width: 32,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 330, left: 200),
            child: Container(
              height: 45,
              width: 150,
              child: TextField(
                readOnly: true,
                onTap: _presentDatePicker,
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
                  labelText: "Enter Date",
                  hintText: dfController.text.toString(),
                  hintStyle: TextStyle(fontWeight: FontWeight.w600),
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
            padding: EdgeInsets.only(top: 483, left: 95),

            //turns: new AlwaysStoppedAnimation(15 / 360),
            child: new Image.asset(
              "images/timeicon.jpg",
              height: 32,
              width: 32,
            ),
          ),
          Container(
              padding: const EdgeInsets.only(top: 470, left: 200),
              child: Time1()),
          Container(
            padding: const EdgeInsets.only(top: 600, left: 120),
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                'Done',
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
        ],
      ),
    );
  }
}
