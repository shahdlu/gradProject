import 'package:flutter/material.dart';

class Walking extends StatelessWidget {
  const Walking({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Container(
              width: 500,
              height: 245,
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
                          'images/walking.jpg',
                          alignment: Alignment.topCenter,
                          fit: BoxFit.cover,
                          width: 150,
                          height: 150,
                        ),
                      ),
                    ),
                  ),
                  Container(
                      //alignment: Alignment.centerLeft,
                      padding: EdgeInsets.only(left: 10, top: 65),
                      child: Text(
                        'Walking',
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
                      padding: EdgeInsets.only(left: 7, top: 12),
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
              padding: const EdgeInsets.only(top: 0),
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '1');
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
                  alignment: Alignment.center,
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                  child: Row(
                    //mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        color: const Color.fromARGB(255, 255, 255, 255),
                        child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 30),
                              child: Text(
                                '1 mile',
                                style: TextStyle(
                                  color: Color.fromARGB(230, 0, 0, 0),
                                  fontSize: 21,
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
                                  padding: EdgeInsets.only(left: 160),
                                  child: const Text(
                                    '100 Kcal ',
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 212, 5, 5),
                                      fontSize: 20,
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
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 0),
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '1');
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
                  alignment: Alignment.center,
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                  child: Row(
                    //mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        color: const Color.fromARGB(255, 255, 255, 255),
                        child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 30),
                              child: Text(
                                '2 mile',
                                style: TextStyle(
                                  color: Color.fromARGB(230, 0, 0, 0),
                                  fontSize: 21,
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
                                  padding: EdgeInsets.only(left: 160),
                                  child: const Text(
                                    '200 Kcal ',
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 212, 5, 5),
                                      fontSize: 20,
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
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 0),
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '1');
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
                  alignment: Alignment.center,
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                  child: Row(
                    //mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        color: const Color.fromARGB(255, 255, 255, 255),
                        child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 30),
                              child: Text(
                                '3 mile',
                                style: TextStyle(
                                  color: Color.fromARGB(230, 0, 0, 0),
                                  fontSize: 21,
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
                                  padding: EdgeInsets.only(left: 160),
                                  child: const Text(
                                    '300 Kcal ',
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 212, 5, 5),
                                      fontSize: 20,
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
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 0),
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '1');
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
                  alignment: Alignment.center,
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                  child: Row(
                    //mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        color: const Color.fromARGB(255, 255, 255, 255),
                        child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 30),
                              child: Text(
                                '4 mile',
                                style: TextStyle(
                                  color: Color.fromARGB(230, 0, 0, 0),
                                  fontSize: 21,
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
                                  padding: EdgeInsets.only(left: 160),
                                  child: const Text(
                                    '400 Kcal ',
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 212, 5, 5),
                                      fontSize: 20,
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
