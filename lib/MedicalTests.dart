import 'package:flutter/material.dart';

import 'A1C.dart';
import 'LFT.dart';
import 'Postprandial.dart';

class medicalTests extends StatelessWidget {
  const medicalTests({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Container(
              width: 500,
              height: 250,
              child: Stack(
                children: [
                  Container(
                    width: 400,
                    height: 230,
                    child: Container(
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30),
                        ),
                        child: Image.asset(
                          'images/blood-test.jpg',
                          alignment: Alignment.topCenter,
                          fit: BoxFit.cover,
                          width: 200,
                          height: 200,
                        ),
                      ),
                    ),
                  ),
                  Container(
                      //alignment: Alignment.centerLeft,

                      padding: EdgeInsets.only(left: 10, top: 65),
                      child: Text(
                        'Medical Tests',
                        style: TextStyle(
                            // shadows: <Shadow>[
                            //   Shadow(
                            //     offset: Offset(3.0, 4.0),
                            //     blurRadius: 4.0,
                            //     color: Color.fromARGB(255, 77, 75, 75),
                            //   ),
                            // ],
                            color: const Color.fromARGB(255, 255, 255, 255),
                            fontWeight: FontWeight.bold,
                            fontSize: 28.0),
                      )),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '///');
                    },
                    child: Container(
                      padding: EdgeInsets.only(left: 7, top: 25),
                      child: Icon(
                        Icons.arrow_back_rounded,
                        color: const Color.fromARGB(255, 255, 255, 255),
                        size: 32,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => A1c(),
                  ));
                },
                child: Container(
                  height: 80,
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
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(right: 5, top: 5),
                              child: Text(
                                'A1C',
                                style: TextStyle(
                                  color: Color.fromARGB(230, 0, 0, 0),
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                  height: 2,
                                ),
                              ),
                            ),
                            // const SizedBox(
                            //   height: 10,
                            // ),
                            Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 35),
                                  child: const Text(
                                    'every 3 months',
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 212, 5, 5),
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400,
                                      height: 1,
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Postprandial(),
                  ));
                },
                child: Container(
                  height: 80,
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
                        padding: EdgeInsets.only(top: 5),
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                left: 30,
                              ),
                              child: Text(
                                'Postprandial blood',
                                style: TextStyle(
                                  color: Color.fromARGB(230, 0, 0, 0),
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                  height: 2,
                                ),
                              ),
                            ),
                            // const SizedBox(
                            //   height: 10,
                            // ),
                            Row(
                              children: [
                                Padding(
                                  padding:
                                      EdgeInsets.only(left: 35, bottom: 10),
                                  child: const Text(
                                    '2 hours after eating',
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 212, 5, 5),
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400,
                                      height: 1,
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => LFT(),
                  ));
                },
                child: Container(
                  height: 80,
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
                        padding: EdgeInsets.only(top: 5),
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                right: 5,
                              ),
                              child: Text(
                                'LFT',
                                style: TextStyle(
                                  color: Color.fromARGB(230, 0, 0, 0),
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                  height: 2,
                                ),
                              ),
                            ),
                            // const SizedBox(
                            //   height: 10,
                            // ),
                            Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 35),
                                  child: const Text(
                                    'from 1 to 2 years',
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 212, 5, 5),
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400,
                                      height: 1,
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        //currentIndex: _currentIndex,
        // onTap: _onTabTapped,
        backgroundColor: Colors.grey,
        selectedItemColor: Colors.lightBlue.shade900,
        unselectedItemColor: Colors.lightBlue.shade900,

        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.timeline),
            label: 'Progress',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
