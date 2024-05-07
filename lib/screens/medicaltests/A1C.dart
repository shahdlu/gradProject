import 'package:flutter/material.dart';
import 'package:gradproj/widgets/cards.dart';
import 'package:gradproj/widgets/icons.dart';
import 'package:gradproj/widgets/dropdownlist.dart';

import '../../theme/constants.dart';
import '../../widgets/text.dart';
import 'A1CPLUS.dart';
import 'MedicalTests.dart';


class A1c extends StatefulWidget {
  @override
  State<A1c> createState() => _A1cState();
}

class _A1cState extends State<A1c> {
   int _current_index = 0;
   List<String> date = ['5-4-2024','3-1-2024'];
   List<String> time = ['10:00 pm','7:30 am'];
   List<double> a1c_perc = [6,5.2];
   List<double> eAg_perc = [7,10];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: kButtonColor,
        title: Row(
          children: [
        TextTitle(
          text: 'A1C',
          textcolor: Colors.white,
        ),
            GestureDetector(
              onTap: () {},
              child: Container(
                padding: EdgeInsets.only(left: 200),
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
                builder: (context) => A1cPLUS(),
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
              textcolor: Colors.black, weight: FontWeight.normal,
            ),

          Padding(
              padding: EdgeInsets.only(left: 50),
              child: NormalText(
                text: time[_current_index],
                textcolor: Colors.black, weight: FontWeight.normal,
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
                 padding: EdgeInsets.only(right: 100),
                            child: NormalText(
                          text: 'A1C',
                          textcolor: kButtonColor, weight: FontWeight.normal,
                        )),
                      NormalText(
                          text: a1c_perc[_current_index].toString() + ' %',
                          textcolor: kButtonColor, weight: FontWeight.normal,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding:
                        EdgeInsets.only(right: 60),
                        child: NormalText(
                          text: 'eAg',
                          textcolor: kButtonColor, weight: FontWeight.normal,
                        )
                      ),
                      NormalText(
                          text: eAg_perc[_current_index].toString()+' mmol',
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
