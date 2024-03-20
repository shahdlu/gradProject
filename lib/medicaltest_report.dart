import 'package:flutter/material.dart';
import 'package:gradproj/constants.dart';
import 'package:gradproj/widgets/calculate_button.dart';

class MedicalTestsReport extends StatefulWidget {
  @override
  _MedicalTestsReportState createState() => _MedicalTestsReportState();
}

class _MedicalTestsReportState extends State<MedicalTestsReport> {
  int _currentIndex = 0;
  List<String> test_name = ['A1C','Postprandial blood','LFT'];
  List<String> test_kind = ['eAg','Blood sugar','ALT'];
  List<String> second_test = ['','','AST'];
  List<String> first_test_perc = ['7.0 mmol','200 mg/dl','24 UI/I'];
  List<String> secnd_test_perc = ['','','42 UI/I'];
  List<String> test_time = ['10 pm','5 pm','8 am'];
  List<String> test_date = ['2024-3-21','2024-8-20','2024-5-16'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //automaticallyImplyLeading: false,
        title: Text(
          'Medical Tests',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),

      ),
      body: _reportPageWidget(),
    );

  }
  Widget _reportPageWidget(){
    return Padding(padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
      child: Column(
      children: [
        Expanded(
          child: ListView.builder(
              itemCount: 3,
              itemBuilder: (context,index){
                _currentIndex = index;
                return Padding(
                    padding: EdgeInsets.fromLTRB(20, 0, 20, 20) ,
                    child: Container(
                        height: 200,
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
                        padding: EdgeInsets.fromLTRB(20, 20, 0, 0),
                            child: Text(
                              test_name[_currentIndex]+' :'
                            )),
                             Padding(
                                padding: EdgeInsets.fromLTRB(30, 15, 0, 0),
                                child: Row(
                                    children: [
                                      Text(
                                        test_kind[_currentIndex],
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Padding(
                                          padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
                                          child: Text(
                                            second_test[_currentIndex],
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          )),
                                      Padding(
                                          padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
                                          child: Text(
                                            'time',
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          )),
                                      Padding(
                                          padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
                                          child: Text(
                                            'date',
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          )),
                                    ]
                                )),
                            Row(
                              children: [
                                Padding(
                                    padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                                    child:  Text(
                                      first_test_perc[_currentIndex],
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: kButtonColor,
                                      ),
                                    )),

                                Padding(
                                    padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                                    child: Text(
                                      secnd_test_perc[_currentIndex],
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: kButtonColor,
                                      ),
                                    )),
                                Padding(
                                    padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                                    child: Text(
                                      test_time[_currentIndex],
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.red,
                                      ),
                                    )),
                                Padding(
                                    padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                                    child: Text(
                                      test_date[_currentIndex],
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.red,
                                      ),
                                    )),
                              ],
                            ),

                          ],
                        )
                    )
                );
              }
          ),
        ),
      Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 30),
      child: CalculateButton(
          title: 'Download',
          onTap: (){
            
          },
          buttonbackcolor: kButtonColor,
          buttontextcolor: Colors.white
      )
      ),

      ],
    ));
  }
}