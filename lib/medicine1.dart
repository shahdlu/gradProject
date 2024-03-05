import 'package:flutter/material.dart';

import 'add_medicine.dart';

class Medicine extends StatefulWidget {
  const Medicine({super.key});

  @override
  State<Medicine> createState() => _MedicineState();
}

class _MedicineState extends State<Medicine> {
  bool checkedValue = false;
  bool checkedValue1 = false;
  bool checkedValue2 = false;
  bool checkedValue3 = false;
  bool checkedValue4 = false;
  bool checkedValue5 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: 210,
                width: 400,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                  child: Image.asset(
                    'images/medicinebackimg.jpg',
                    // alignment: Alignment.topCenter,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                  padding: EdgeInsets.only(left: 30, top: 60),
                  child: Text(
                    'Medicine',
                    style: TextStyle(
                        color: Color(0xff0861E7),
                        fontWeight: FontWeight.bold,
                        fontSize: 37.0),
                  )),
              Container(
                  padding: EdgeInsets.only(left: 30, top: 130),
                  child: Text(
                    'your health is our\nmission',
                    style: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0), fontSize: 18.0),
                  )),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/');
                },
                child: Container(
                  padding: EdgeInsets.only(left: 7, top: 12),
                  child: Icon(
                    Icons.arrow_back_rounded,
                    color: Color(0xff0861E7),
                    size: 32,
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                padding: EdgeInsets.only(left: 40, top: 30, bottom: 30),
                child: Text(
                  "Daily Review",
                  style: TextStyle(
                      color: Color(0xff0861E7),
                      fontWeight: FontWeight.bold,
                      fontSize: 29.0),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 30, bottom: 30, left: 5),
                child: RotationTransition(
                  turns: new AlwaysStoppedAnimation(15 / 360),
                  child: new Image.asset(
                    "images/0c730b7085da218c278b73390f6770d0.png",
                    height: 37,
                    width: 37,
                  ),
                ),
              )
            ],
          ),
          Column(
            children: [
              Container(
                child: Stack(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 20, top: 10, bottom: 10),
                      child: Text(
                        "Metformin",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.w400),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/');
                      },
                      child: Container(
                        padding: EdgeInsets.only(left: 290, top: 15),
                        child: Icon(
                          Icons.arrow_circle_right_outlined,
                          color: Color(0xff0861E7),
                          size: 32,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 40),
                      child: CheckboxListTile(
                        title: Text("10:00 PM"),
                        value: checkedValue,
                        onChanged: (newValue) {
                          setState(() {
                            checkedValue = newValue!;
                          });
                        },
                        controlAffinity: ListTileControlAffinity.leading,
                        //  <-- leading Checkbox
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 70),
                      child: CheckboxListTile(
                        title: Text("8:00 AM"),
                        value: checkedValue1,
                        onChanged: (newValue1) {
                          setState(() {
                            checkedValue1 = newValue1!;
                          });
                        },
                        controlAffinity: ListTileControlAffinity.leading,
                        //  <-- leading Checkbox
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 100),
                      child: CheckboxListTile(
                        title: Text("2:00 PM"),
                        value: checkedValue2,
                        onChanged: (newValue2) {
                          setState(() {
                            checkedValue2 = newValue2!;
                          });
                        },
                        controlAffinity: ListTileControlAffinity.leading,
                        //  <-- leading Checkbox
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 110, left: 220),
                      child: Text(
                        "Dosage : 2 ",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w400),
                      ),
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: const Color(0xffFBFDFF),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 1.0,
                      offset: Offset(0, 1),
                    ),
                  ],
                ),
                width: 350,
                height: 150,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30, bottom: 25),
                child: Container(
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 20, top: 10, bottom: 10),
                        child: Text(
                          "Omega3",
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.w400),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/');
                        },
                        child: Container(
                          padding: EdgeInsets.only(left: 290, top: 15),
                          child: Icon(
                            Icons.arrow_circle_right_outlined,
                            color: Color(0xff0861E7),
                            size: 32,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 40),
                        child: CheckboxListTile(
                          title: Text("10:00 PM"),
                          value: checkedValue3,
                          onChanged: (newValue3) {
                            setState(() {
                              checkedValue3 = newValue3!;
                            });
                          },
                          controlAffinity: ListTileControlAffinity.leading,
                          //  <-- leading Checkbox
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 70),
                        child: CheckboxListTile(
                          title: Text("8:00 AM"),
                          value: checkedValue4,
                          onChanged: (newValue4) {
                            setState(() {
                              checkedValue4 = newValue4!;
                            });
                          },
                          controlAffinity: ListTileControlAffinity.leading,
                          //  <-- leading Checkbox
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 100),
                        child: CheckboxListTile(
                          title: Text("2:00 PM"),
                          value: checkedValue5,
                          onChanged: (newValue5) {
                            setState(() {
                              checkedValue5 = newValue5!;
                            });
                          },
                          controlAffinity: ListTileControlAffinity.leading,
                          //  <-- leading Checkbox
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 110, left: 220),
                        child: Text(
                          "Dosage : 1 ",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w400),
                        ),
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: const Color(0xffFBFDFF),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 1.0,
                        offset: Offset(0, 1),
                      ),
                    ],
                  ),
                  width: 350,
                  height: 150,
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (v)=> Add_med())
                  );
                },
                child: Text(
                  'Add new medicine',
                  style: TextStyle(
                    fontSize: 23,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Color(0xff0861E7),
                  onPrimary: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
