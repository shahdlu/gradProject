import 'package:flutter/material.dart';

import '../../theme/constants.dart';
import '../../widgets/cards.dart';
import '../../widgets/icons.dart';
import '../../widgets/text.dart';
import 'MedicalTests.dart';
import 'PostprandialPlus.dart';

class Postprandial extends StatefulWidget{
@override
State<Postprandial> createState() => _PostprandalState();
}

class _PostprandalState extends State<Postprandial> {
  int _current_index = 0;
  List<String> date = ['5-4-2024','3-1-2024'];
  List<String> time = ['10:00 pm','7:30 am'];
  List<double> bloodsugar_perc = [200,240];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          foregroundColor: Colors.white,
          backgroundColor: kButtonColor,
          title: Row(
              children: [
                TextTitle(
                  text: 'Postprandal blood',
                  textcolor: Colors.white,
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    padding: EdgeInsets.only(left: 20),
                    child: Icon(
                      Icons.download_sharp,
                      color: Colors.white,
                      size: 25,
                    ),
                  ),
                ),
              ]),
        ) ,
        body: Column(
            children: [
              Expanded(
                child: ListView.builder(
                    itemCount: date.length,
                    itemBuilder: (context , index){
                      _current_index = index;
                      return CustomCard(
                          card_content: _content(),
                          card_height: 150,
                          card_action: (){

                          }
                      );
                    }
                ),
              ),
              Padding(
                  padding: EdgeInsets.only(bottom: 30),
                  child: RawMaterialButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => PostprandialPlus(),
                      ));
                    },
                    elevation: 2.0,
                    fillColor: kButtonColor,
                    child: Icon(
                      Icons.add,
                      color: Color.fromARGB(255, 255, 255, 255),
                      size: 35.0,
                    ),
                    padding: EdgeInsets.all(15.0),
                    shape: CircleBorder(),
                  )),

            ])
    );
  }
  Widget _content(){
    return Column(
        children: [
          Padding(
              padding: EdgeInsets.only(top: 15,left: 20),
              child: Row(
                children: [
                  NormalText(
                    text: date[_current_index],
                    textcolor: Colors.black,
                    weight: FontWeight.normal,
                  ),

                  Padding(
                      padding: EdgeInsets.only(left: 50),
                      child: NormalText(
                        text: time[_current_index],
                        textcolor: Colors.black,
                        weight: FontWeight.normal,
                      )
                  ),
                  Padding(
                      padding: const EdgeInsets.only(left: 30),
                      child: SmallIcon(
                        icon_name: Icons.delete,
                        action: () {  },

                      )
                  ),
                ],
              )),
          Row(
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
                    Padding(
                        padding: EdgeInsets.only(left: 0),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Padding(
                                    padding: EdgeInsets.only(right: 40),
                                    child: NormalText(
                                      text: 'blood\nsugar',
                                      textcolor: kButtonColor, weight: FontWeight.normal,
                                    )),
                                NormalText(
                                  text: bloodsugar_perc[_current_index].toString() + ' mg/dl',
                                  textcolor: kButtonColor, weight: FontWeight.normal,
                                ),
                              ],
                            ),
                          ],
                        )),

                  ],
                ),
              ),
            ],
          )
        ]);
  }
}
