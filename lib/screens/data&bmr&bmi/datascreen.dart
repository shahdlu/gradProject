import 'package:flutter/material.dart';
import 'package:gradproj/widgets/text.dart';

import '../../theme/constants.dart';
import '../../widgets/button.dart';
import '../../widgets/cards.dart';
import '../../widgets/rectangle_icon_button.dart';
import 'user_activity_data.dart';


enum Gender {
  male,
  female,
}

class DataHomeScreen extends StatefulWidget {
  const DataHomeScreen({super.key});

  @override
  State<DataHomeScreen> createState() => _DataHomeScreenState();
}

class _DataHomeScreenState extends State<DataHomeScreen> {
  Gender selectedGender = Gender.male;
  int age = 19;
  int height = 170;
  int weight = 65;
  bool gender = MALE;
  bool isMaleButtonActivated = false;
  bool isFemaleButtonActivated = true;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: TextTitle(
          text: "Tell us about yourself",
          textcolor: Colors.black,
        ),
      ),
          body:
          Column(
            children: [
              Padding(
                  padding: EdgeInsets.all(20),
                child: Row(
                  children: [
                  RectangleIconButton(
                      onPressed: (){
                        setState(() {
                          gender = MALE;
                          isMaleButtonActivated = true;
                          isFemaleButtonActivated = false;
                        });
                      },
                      backcolor: isMaleButtonActivated? kButtonColor : Color.fromRGBO(145, 143, 143, 1.0),
                      icon_name: Icons.male,
                      icon_padding_top: 30,
                      icon_padding_left: 0,
                      text_padding_left: 20,
                      text: 'Male'
                  ),
                    Padding(
                        padding: EdgeInsets.only(left: 50),
                      child: RectangleIconButton(
                          onPressed: (){
                            setState(() {
                              gender = FEMALE;
                              isMaleButtonActivated = false;
                              isFemaleButtonActivated = true;
                            });
                          },
                          backcolor: isFemaleButtonActivated? kButtonColor : Color.fromRGBO(145, 143, 143, 1.0),
                          icon_name: Icons.female,
                          icon_padding_top: 20,
                          icon_padding_left: 0,
                          text_padding_left: 20,
                          text: 'Female'
                      ),
                    )
                ],)
              ),
              Expanded(
                flex: 2,
                child:  CircularCard(
                      child: Column(
                          children: [
                         SubTitle(
                          text: "Height (cm)",
                          textcolor: Colors.black,
                           weight: FontWeight.bold,
                        ),
                         Expanded(
                         child: Padding(
                           padding: EdgeInsets.only(top: 15),
                         child: SubTitle(
                            text: height.toString(),
                            textcolor: Colors.black,
                            weight: FontWeight.bold,
                          ))),
                        Expanded(
                          child: Slider(
                            value: height.toDouble(),
                            onChanged: (value) => setState(() {
                              height = value.toInt();
                            }),
                            activeColor: const Color(0xFF0861E7),
                            //inactiveColor: Color(0xFF0861E7),
                            thumbColor: Color(0xFF0861E7),
                            overlayColor: MaterialStatePropertyAll(
                                Color.fromARGB(255, 165, 196, 241)),
                            min: 120,
                            max: 220,
                          ),
                        )
                      ]),
                    )),
              Expanded(
                flex: 2,
                child: Row(
                  children: [
                    Expanded(
                      child: CircularCard(
                        child: Column(children: [
                          const SubTitle(
                            text: "Age",
                            textcolor: Colors.black,
                            weight: FontWeight.bold,
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(top: 15),
                              child: SubTitle(
                                text: age.toString(),
                                textcolor: Colors.black,
                                weight: FontWeight.bold,
                            ),
                          )),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Center(
                                    child: CustomIconButton(
                                      icon_name: Icons.remove,
                                      action: () {
                                        setState(() {
                                          age--;
                                        });
                                      },

                                    )
                                  ),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Expanded(
                                  child: CustomIconButton(
                                    icon_name: Icons.add,
                                    action: (){
                                      setState(() {
                                        age++;
                                      });
                                    },
                                  )
                                ),
                              ],
                            ),
                          )
                        ]),
                      ),
                    ),
                    Expanded(
                      child: CircularCard(
                        child: Column(children: [
                          const SubTitle(
                            text: "Weight (kg)",
                            textcolor: Colors.black,
                            weight: FontWeight.bold,
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(top: 15),
                              child: SubTitle(
                                    text: weight.toString(),
                                    textcolor: Colors.black,
                                    weight: FontWeight.bold,
                                )),
                          ),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: CustomIconButton(
                                    action: () {
                                      setState(() {
                                        weight--;
                                      });
                                    },
                                      icon_name: Icons.remove
                                    )),
                                const SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: CustomIconButton(
                                    action: () {
                                      setState(() {
                                        weight++;
                                      });
                                    },
                                    icon_name: Icons.add,
                                  )
                                ),
                              ],
                            ),
                          )
                        ]),
                      ),
                    ),
                  ],
                ),
              ),
                    Padding(
                        padding: EdgeInsets.only(top: 20,bottom: 20),
                    child: CalculateButton(
                          title: "Continue",
                          buttonbackcolor: kButtonColor,
                          buttontextcolor: Colors.white,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => UserActivityData(
                                  height: height,
                                  weight: weight,
                                  gender: gender,
                                  age: age,
                                ),
                              ),
                            );
                          })),
            ],
          ),
        );
  }
}
