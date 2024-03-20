import 'package:flutter/material.dart';
import 'package:gradproj/constants.dart';

class MedicineReport extends StatefulWidget {
  @override
  _MedicineReportState createState() => _MedicineReportState();
}

class _MedicineReportState extends State<MedicineReport> {
  int _currentIndex = 0;
  DateTime selectedDate = DateTime.now();
  List<String> medicine_name = ['metformin','omega3'];
  List<String> dosage = ['2','1'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //automaticallyImplyLeading: false,
        title: Text(
          'Medicine',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),

      ),
      body: _reportPageWidget(),
    );

  }
  Widget _reportPageWidget(){
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(80, 30, 0, 20),
          child: Row(
              children: [
                Text(
                  'select date',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16

                  ),
                ),
                Padding(
                    padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                    child:  GestureDetector(
                      onTap: () async {
                        final DateTime? dateTime = await showDatePicker(
                            context: context,
                            initialDate: selectedDate,
                            firstDate: DateTime(2000),
                            lastDate: DateTime(3000)
                        );
                        if(dateTime != null){
                          setState(() {
                            selectedDate = dateTime;
                          });
                        }
                      },
                      child: Container(
                        width: 140,
                        height: 50,
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
                        child: Padding(padding: EdgeInsets.all(15),
                          child: Text(
                            '${selectedDate.year} - ${selectedDate.month} - ${selectedDate.day}',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    )),
              ]),
        ),
               Padding(
                    padding: EdgeInsets.fromLTRB(20, 0, 20, 20) ,
                    child: Container(
                        height: 600,
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
                        child: Column(
                          children: [
                            Padding(
                                padding: EdgeInsets.fromLTRB(30, 20, 0, 0),
                                child: Row(
                                    children: [
                                      Text(
                                        'Medicine',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Padding(
                                          padding: EdgeInsets.fromLTRB(100, 0, 0, 0),
                                          child: Text(
                                            'Dosage',
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          )),
                                    ]
                                )),
                            Column(
                              children: [
                                Row(
                              children: [
                                Padding(
                                    padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
                                    child:  Text(
                                      medicine_name[_currentIndex],
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: kButtonColor,
                                      ),
                                    )),

                                Padding(
                                    padding: EdgeInsets.fromLTRB(120, 0, 0, 0),
                                    child: Text(
                                      dosage[_currentIndex],
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: kButtonColor,
                                      ),
                                    )),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(50, 0, 0, 0),
                                  child: Icon(
                                    Icons.check_circle,
                                    color: Colors.red,
                                  ),
                                )
                              ],
                            ),
                                Row(
                                  children: [
                                    Padding(
                                        padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
                                        child:  Text(
                                          medicine_name[1],
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: kButtonColor,
                                          ),
                                        )),

                                    Padding(
                                        padding: EdgeInsets.fromLTRB(120, 0, 0, 0),
                                        child: Text(
                                          dosage[1],
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: kButtonColor,
                                          ),
                                        )),
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(50, 0, 0, 0),
                                      child: Icon(
                                        Icons.dangerous,
                                        color: Colors.red,
                                      ),
                                    )
                                  ],
                                ),
                              ],)

                          ],
                        )
                    )
                ),

      ],
    );
  }
}