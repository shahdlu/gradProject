import 'package:flutter/material.dart';
import 'package:gradproj/report.dart';
import 'package:gradproj/settings.dart';

import 'homepage.dart';

//List<String> _locations = ['A', 'B', 'C', 'D'];

class Medicine extends StatefulWidget {
  const Medicine({super.key});

  @override
  State<Medicine> createState() => _MedicineState();
}

class _MedicineState extends State<Medicine> {
  int _currentIndex  = 0;
  String? selected = '08';

  List<String> itemsList = [
    "01",
    "02",
    "03",
    "04",
    "05",
    "06",
    "07",
    "08",
    "09",
    "10",
    "11",
    "12"
  ];
  String? selected1 = '08';
  List<String> itemsList1 = [
    "00",
    "01",
    "02",
    "03",
    "04",
    "05",
    "06",
    "07",
    "08",
    "09",
    "10",
    "11",
    "12",
    "13",
    "14",
    "15",
    "16",
    "17",
    "18",
    "19",
    "20",
    "21",
    "22",
    "23",
    "24",
    "25",
    "26",
    "27",
    "28",
    "29",
    "30",
    "31",
    "32",
    "33",
    "34",
    "35",
    "36",
    "37",
    "38",
    "39",
    "40",
    "41",
    "42",
    "43",
    "44",
    "45",
    "46",
    "47",
    "48",
    "49",
    "50",
    "51",
    "52",
    "53",
    "54",
    "55",
    "56",
    "57",
    "58",
    "59",
  ];

  String? selected2 = '08';
  List<String> itemsList2 = [
    "01",
    "02",
    "03",
    "04",
    "05",
    "06",
    "07",
    "08",
    "09",
    "10",
    "11",
    "12"
  ];
  String? selected3 = '08';
  List<String> itemsList3 = [
    "00",
    "01",
    "02",
    "03",
    "04",
    "05",
    "06",
    "07",
    "08",
    "09",
    "10",
    "11",
    "12",
    "13",
    "14",
    "15",
    "16",
    "17",
    "18",
    "19",
    "20",
    "21",
    "22",
    "23",
    "24",
    "25",
    "26",
    "27",
    "28",
    "29",
    "30",
    "31",
    "32",
    "33",
    "34",
    "35",
    "36",
    "37",
    "38",
    "39",
    "40",
    "41",
    "42",
    "43",
    "44",
    "45",
    "46",
    "47",
    "48",
    "49",
    "50",
    "51",
    "52",
    "53",
    "54",
    "55",
    "56",
    "57",
    "58",
    "59",
  ];
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
  String? selected4 = 'AM';
  List<String> itemsList4 = [
    "AM",
    "PM",
  ];

  String? selected5 = 'AM';
  List<String> itemsList5 = [
    "AM",
    "PM",
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Health Pulse',

        home: Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: 280,
                width: 400,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                  child: Image.asset(
                    'images/medicineimg.jpg',
                    // alignment: Alignment.topCenter,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Row(
                children: [
                  Container(
                      padding: EdgeInsets.only(left: 20, top: 60),
                      child: Text(
                        'Medicine',
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
                            fontSize: 30.0),
                      )),
                  Container(
                    padding: EdgeInsets.only(left: 8, top: 60),
                    child: Icon(
                      Icons.medication_liquid_outlined,
                      /*shadows: <Shadow>[
                        Shadow(
                          offset: Offset(3.0, 4.0),
                          blurRadius: 4.0,
                          color: Color.fromARGB(255, 77, 75, 75),
                        ),
                      ],*/
                      color: const Color.fromARGB(255, 252, 252, 252),
                      size: 30.0,
                      semanticLabel: 'Text to announce in accessibility modes',
                    ),
                  ),

                ],
              ),
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
          Padding(
            padding: EdgeInsets.only(top: 20, right: 35),
            child: const Text(
              "Tell us when you\ntake your medicine ?",
              style: TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontWeight: FontWeight.bold,
                  fontSize: 23.0),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, right: 10),
            child: Text(
              "Hours  :  Min",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff0861E7)),
            ),
          ),
          Row(
            children: [
              Container(
                padding: EdgeInsets.only(left: 124),
                child: DropdownButton<String>(
                    value: selected,
                    underline: SizedBox(),
                    menuMaxHeight: 300,
                    icon: Icon(
                      Icons.keyboard_arrow_down_rounded,
                      color: Color(0xff0861E7),
                      size: 25,
                    ),
                    items: itemsList
                        .map((item) => DropdownMenuItem(
                            value: item,
                            alignment: Alignment.center,
                            child: Text(item,
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Color(0xff0861E7),
                                  fontWeight: FontWeight.w600,
                                ))))
                        .toList(),
                    onChanged: (item) => setState(() => selected = item)),
              ),
              Text(
                " : ",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff0861E7)),
              ),
              Container(
                child: DropdownButton<String>(
                    value: selected1,
                    underline: SizedBox(),
                    menuMaxHeight: 300,
                    icon: Icon(
                      Icons.keyboard_arrow_down_rounded,
                      color: Color(0xff0861E7),
                      size: 25,
                    ),
                    items: itemsList1
                        .map((item) => DropdownMenuItem(
                            value: item,
                            alignment: Alignment.center,
                            child: Text(item,
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Color(0xff0861E7),
                                  fontWeight: FontWeight.w600,
                                ))))
                        .toList(),
                    onChanged: (item) => setState(() => selected1 = item)),
              ),
              Container(
                padding: EdgeInsets.only(left: 10),
                child: DropdownButton<String>(
                    value: selected4,
                    underline: SizedBox(),
                    menuMaxHeight: 300,
                    iconSize: 0.0,
                    items: itemsList4
                        .map((item) => DropdownMenuItem(
                            value: item,
                            alignment: Alignment.center,
                            child: Text(item,
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Color(0xff0861E7),
                                  fontWeight: FontWeight.w600,
                                ))))
                        .toList(),
                    onChanged: (item) => setState(() => selected4 = item)),
              ),
            ],
          ),
          Container(
            width: 200,
            padding: EdgeInsets.only(
              left: 10,
            ),
            child: Image.asset(
              "images/horizontalline.jpg",
              width: 150,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 50),
            child: const Text(
              "What is the time period between each dose ?",
              style: TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontWeight: FontWeight.bold,
                  fontSize: 23.0),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, right: 10),
            child: Text(
              "Hours  :  Min",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff0861E7)),
            ),
          ),
          Row(
            children: [
              Container(
                padding: EdgeInsets.only(left: 122),
                child: DropdownButton<String>(
                    value: selected2,
                    underline: SizedBox(),
                    menuMaxHeight: 300,
                    icon: Icon(
                      Icons.keyboard_arrow_down_rounded,
                      color: Color(0xff0861E7),
                      size: 25,
                    ),
                    items: itemsList2
                        .map((item) => DropdownMenuItem(
                            value: item,
                            alignment: Alignment.center,
                            child: Text(item,
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Color(0xff0861E7),
                                  fontWeight: FontWeight.w600,
                                ))))
                        .toList(),
                    onChanged: (item) => setState(() => selected2 = item)),
              ),
              Text(
                " : ",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff0861E7)),
              ),
              Container(
                child: DropdownButton<String>(
                    value: selected3,
                    underline: SizedBox(),
                    menuMaxHeight: 300,
                    icon: Icon(
                      Icons.keyboard_arrow_down_rounded,
                      color: Color(0xff0861E7),
                      size: 25,
                    ),
                    items: itemsList3
                        .map((item) => DropdownMenuItem(
                            value: item,
                            alignment: Alignment.center,
                            child: Text(item,
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Color(0xff0861E7),
                                  fontWeight: FontWeight.w600,
                                ))))
                        .toList(),
                    onChanged: (item) => setState(() => selected3 = item)),
              ),
              Container(
                padding: EdgeInsets.only(left: 10),
                child: DropdownButton<String>(
                    value: selected5,
                    underline: SizedBox(),
                    menuMaxHeight: 300,
                    iconSize: 0.0,
                    items: itemsList5
                        .map((item) => DropdownMenuItem(
                            value: item,
                            alignment: Alignment.center,
                            child: Text(item,
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Color(0xff0861E7),
                                  fontWeight: FontWeight.w600,
                                ))))
                        .toList(),
                    onChanged: (item) => setState(() => selected5 = item)),
              ),
            ],
          ),
        ],
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
