// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:gradproj/homepage.dart';
import 'package:gradproj/screens/home.dart';
import '../constants.dart';
import '../widgets/calculate_button.dart';
import '../widgets/circular_card.dart';

class BMICalculator extends StatelessWidget {
  const BMICalculator({super.key, required this.bmiResult});
  final String bmiResult;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Health Pulse',
        home: Scaffold(
          appBar: AppBar(
            title: const Text(
              "BMI Calculator",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w900,
                letterSpacing: 1,
              ),
            ),
            centerTitle: true,
            automaticallyImplyLeading: false,
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 6,
                child: CircularCard(
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(padding: EdgeInsets.fromLTRB(0, 50, 0, 0)),
                      const Text(
                        "BMI Result",
                        style: kResultLabelTextStyle,
                      ),
                      Padding(padding: EdgeInsets.fromLTRB(0, 15, 0, 0)),
                      Text(
                        bmiResult.toString(),
                        //bmrResult.toString(),
                        style: kResultTextStyle,
                      ),
                      Padding(padding: EdgeInsets.fromLTRB(0, 110, 0, 0)),
                      Container(
                        padding: const EdgeInsets.all(15.0),
                        child: Expanded(
                          flex: 6,
                          child: CalculateButton(
                              title: "Continue",
                              buttonbackcolor: kButtonColor,
                              buttontextcolor: Colors.white,
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (v) => HomePageScreen()));
                              }),
                        ),
                        // Spacer(
                        //   flex: 1,
                        // ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
