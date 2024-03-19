import 'package:flutter/material.dart';

import 'LFT_PLUS.dart';
import 'MedicalTests.dart';

class LFT extends StatelessWidget {
  const LFT({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // bar
          Container(
            color: Color(0xff0861E7),
            height: 100,
            width: 400,
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => medicalTests(),
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
                  padding: const EdgeInsets.only(left: 20, top: 20),
                  child: Text("LFT",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      )),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    padding: EdgeInsets.only(left: 230, top: 20),
                    child: Icon(
                      Icons.download_sharp,
                      color: const Color.fromARGB(255, 255, 255, 255),
                      size: 30,
                    ),
                  ),
                ),
              ],
            ),
          ),
          //test 1
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Container(
              width: 400,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Color.fromARGB(255, 255, 255, 255),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              margin: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
              child: Row(
                //mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 1),
                    child: Row(
                      children: [
                        Image.asset(
                          'images/testimg.jpg',
                          width: 100,
                          height: 100,
                        ),
                        Column(
                          children: [
                            Row(
                              children: [
                                Container(
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(top: 5),
                                        child: Text(
                                          '1/3/2024 ',
                                          style: TextStyle(
                                            color: Color.fromARGB(230, 0, 0, 0),
                                            fontSize: 17,
                                            fontWeight: FontWeight.w700,
                                            height: 2,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 50,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(top: 5),
                                        child: Text(
                                          '10:00 pm',
                                          style: TextStyle(
                                            color: Color.fromARGB(230, 0, 0, 0),
                                            fontSize: 17,
                                            fontWeight: FontWeight.w700,
                                            height: 2,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(top: 5),
                                  child: Text(
                                    'ALT',
                                    style: TextStyle(
                                      color: Color(0xff0861E7),
                                      fontSize: 17,
                                      fontWeight: FontWeight.w700,
                                      height: 2,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 60,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 5),
                                  child: Text(
                                    '24 UI/I',
                                    style: TextStyle(
                                      color: Color(0xff0861E7),
                                      fontSize: 17,
                                      fontWeight: FontWeight.w700,
                                      height: 2,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(top: 5),
                                  child: Text(
                                    'AST',
                                    style: TextStyle(
                                      color: Color(0xff0861E7),
                                      fontSize: 17,
                                      fontWeight: FontWeight.w700,
                                      height: 2,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 60,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 5),
                                  child: Text(
                                    '42 UI/I',
                                    style: TextStyle(
                                      color: Color(0xff0861E7),
                                      fontSize: 17,
                                      fontWeight: FontWeight.w700,
                                      height: 2,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          //test 2
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Container(
              width: 400,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Color.fromARGB(255, 255, 255, 255),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              margin: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
              child: Row(
                //mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 1),
                    child: Row(
                      children: [
                        Image.asset(
                          'images/testimg.jpg',
                          width: 100,
                          height: 100,
                        ),
                        Column(
                          children: [
                            Row(
                              children: [
                                Container(
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(top: 5),
                                        child: Text(
                                          '1/3/2024 ',
                                          style: TextStyle(
                                            color: Color.fromARGB(230, 0, 0, 0),
                                            fontSize: 17,
                                            fontWeight: FontWeight.w700,
                                            height: 2,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 50,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(top: 5),
                                        child: Text(
                                          '10:00 pm',
                                          style: TextStyle(
                                            color: Color.fromARGB(230, 0, 0, 0),
                                            fontSize: 17,
                                            fontWeight: FontWeight.w700,
                                            height: 2,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(top: 5),
                                  child: Text(
                                    'ALT',
                                    style: TextStyle(
                                      color: Color(0xff0861E7),
                                      fontSize: 17,
                                      fontWeight: FontWeight.w700,
                                      height: 2,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 60,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 5),
                                  child: Text(
                                    '24 UI/I',
                                    style: TextStyle(
                                      color: Color(0xff0861E7),
                                      fontSize: 17,
                                      fontWeight: FontWeight.w700,
                                      height: 2,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(top: 5),
                                  child: Text(
                                    'AST',
                                    style: TextStyle(
                                      color: Color(0xff0861E7),
                                      fontSize: 17,
                                      fontWeight: FontWeight.w700,
                                      height: 2,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 60,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 5),
                                  child: Text(
                                    '42 UI/I',
                                    style: TextStyle(
                                      color: Color(0xff0861E7),
                                      fontSize: 17,
                                      fontWeight: FontWeight.w700,
                                      height: 2,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          //sizeBox
          SizedBox(
            height: 250,
          ),
          //button
          RawMaterialButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => LFT_PLUS(),
              ));
            },
            elevation: 2.0,
            fillColor: Color(0xff0861E7),
            child: Icon(
              Icons.add,
              color: Color.fromARGB(255, 255, 255, 255),
              size: 35.0,
            ),
            padding: EdgeInsets.all(15.0),
            shape: CircleBorder(),
          ),
        ],
      ),
    );
  }
}
