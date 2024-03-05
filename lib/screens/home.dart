
import 'package:flutter/material.dart';
import 'package:gradproj/screens/result.dart';
import '../calculator_brain.dart';
import '../constants.dart';
import '../widgets/circular_card.dart';
import '../widgets/calculate_button.dart';
import '../widgets/rectangle_icon_button.dart';

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
    return MaterialApp(
        title: 'Health Pulse',
        home: Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: 100,
            padding:  EdgeInsets.only(top: 50.0, bottom: 0),
            child: const Text(
              "Tell us about yourself",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w900,
                letterSpacing: 1,
              ),
            ),
          ),
          Container( height: 180,
         child: Expanded(
            flex: 2,
            child: Row(
              children: [
                GestureDetector(
                  onTap: (){ setState(() {
                    gender = MALE;
                    isMaleButtonActivated = true;
                    isFemaleButtonActivated = false;
                  });},
               child: Expanded(
                  child: Column(children: [
                    Expanded(
                      child: Stack(
                        //mainAxisAlignment: MainAxisAlignment.center,
                        //crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                left: 30,
                                top: 30,
                                bottom: 0,
                              ),
                              child: Column(
                                children: [
                                  RectangleIconButton(
                                    onPressed: () {
                                      setState(() {
                                        gender = MALE;
                                        isMaleButtonActivated = true;
                                        isFemaleButtonActivated = false;
                                      });
                                    }, backcolor: !isMaleButtonActivated ? Color.fromRGBO(145, 143, 143, 1.0) : kButtonColor,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 55,
                              left: 75,
                            ),
                            child: Icon(
                              Icons.male,
                              size: 60,
                              color: Colors.white,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 110,
                              left: 75,
                              bottom: 30,
                              right: 40,
                            ),
                            child: const Text(
                              "Male",
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ]),
                ),),
            GestureDetector(
              onTap: (){ setState(() {
                gender = FEMALE;
                isMaleButtonActivated = false;
                isFemaleButtonActivated = true;
              });},
              child: Expanded(
                  child: Column(children: [
                    Expanded(
                      child: Stack(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                left: 30,
                                top: 30,
                                bottom: 0,
                              ),
                              child: RectangleIconButton(
                                onPressed: () {
                                  setState(() {
                                    gender = FEMALE;
                                    isMaleButtonActivated = false;
                                    isFemaleButtonActivated = true;
                                  });
                                }, backcolor: isFemaleButtonActivated ? kButtonColor : Color.fromRGBO(145, 143, 143, 1.0) ,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 55,
                              left: 75,
                            ),
                            child: Icon(
                              Icons.female,
                              size: 60,
                              color: Colors.white,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 110,
                              left: 65,
                              bottom: 30,
                              right: 40,
                            ),
                            child: const Text(
                              "Female",
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                        ],
                      ),
                    )
                  ]),
                )),
              ],
            ),
          )),
          Expanded(flex: 2,
           child: Padding(
             padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
            child: CircularCard(
              child: Column(children: [
                const Text(
                  "Height (cm)",
                  style: kTitleTextStyle,
                ),
                Expanded(
                  child: Text(
                    height.toString(),
                    style: kLabelTextStyle,
                  ),
                ),
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
          ),
          Expanded(
            flex: 2,
            child: Row(
              children: [
                Expanded(
                  child: CircularCard(
                    child: Column(children: [
                      const Text(
                        "Age",
                        style: kTitleTextStyle,
                      ),
                      Expanded(
                        child: Text(age.toString(), style: kLabelTextStyle),
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Center(
                                child: MaterialButton(
                                  child: Icon(
                                    Icons.remove,
                                    size: 25,
                                    weight: 900,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      age--;
                                    });
                                  },
                                  color: Color(0xFF0861E7),
                                  textColor: Color.fromARGB(255, 255, 255, 255),
                                  shape: CircleBorder(),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Expanded(
                              child: MaterialButton(
                                child: Icon(
                                  Icons.add,
                                  size: 25,
                                  weight: 900,
                                ),
                                onPressed: () {
                                  setState(() {
                                    age++;
                                  });
                                },
                                color: Color(0xFF0861E7),
                                textColor: Color.fromARGB(255, 255, 255, 255),
                                shape: CircleBorder(),
                              ),
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
                      const Text(
                        "Weight (kg)",
                        style: kTitleTextStyle,
                      ),
                      Expanded(
                        child: Text(weight.toString(), style: kLabelTextStyle),
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: MaterialButton(
                                child: Icon(
                                  Icons.remove,
                                  size: 25,
                                  weight: 900,
                                ),
                                onPressed: () {
                                  setState(() {
                                    weight--;
                                  });
                                },
                                color: Color(0xFF0861E7),
                                textColor: Color.fromARGB(255, 255, 255, 255),
                                shape: CircleBorder(),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: MaterialButton(
                                child: Icon(
                                  Icons.add,
                                  size: 25,
                                  weight: 900,
                                ),
                                onPressed: () {
                                  setState(() {
                                    weight++;
                                  });
                                },
                                color: Color(0xFF0861E7),
                                textColor: Color.fromARGB(255, 255, 255, 255),
                                shape: CircleBorder(),
                              ),
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
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.only(left: 25, bottom: 20),
                  child: CalculateButton(
                      onTap: () {
                           Navigator.pop(context);
                      },
                      title: "Back",
                    buttonbackcolor: Color.fromRGBO(
                        8, 97, 231, 0.14901960784313725),
                    buttontextcolor: kButtonColor,

                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 25, bottom: 20),
                child: Expanded(
                  //flex: 5,
                  child: CalculateButton(
                      title: "Continue",
                      buttonbackcolor: kButtonColor,
                      buttontextcolor: Colors.white,
                      onTap: () {
                        CalculatorBrain calculatorBrain = CalculatorBrain(
                          age: age,
                          weight: weight,
                          height: height,
                          gender: gender,
                        );

                        print(calculatorBrain.result());

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ResultScreen(
                              bmrResult: calculatorBrain.result(),
                              icon: calculatorBrain.getGenderIcon(),
                            ),
                          ),
                        );
                      }),
                ),
              ),
            ],
          ),
        ],
      ),
    ));
  }
}
