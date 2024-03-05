// ignore_for_file: prefer_const_constructors


import 'package:flutter/material.dart';
import 'package:gradproj/homepage.dart';
import '../constants.dart';
import '../widgets/calculate_button.dart';
import '../widgets/circular_card.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key, required this.bmrResult, required this.icon});

  final String bmrResult;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Health Pulse',

        home: Scaffold(
      appBar: AppBar(
        title: const Text(
          "BMR Calculator",
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
                    "BMR Result",
                    style: kResultLabelTextStyle,
                  ),
                  Padding(padding: EdgeInsets.fromLTRB(0, 15, 0, 0)),

                  Text(
                    bmrResult.toString(),
                    style: kResultTextStyle,
                  ),
                  Padding(padding: EdgeInsets.fromLTRB(0, 15, 0, 0)),

                  const Text(
                    "Calories / Day",
                    style: kResultSmallTextStyle,
                  ),
                  Padding(padding: EdgeInsets.fromLTRB(0, 15, 0, 0)),
                  Icon(
                    icon,
                    size: 120,
                    color: kButtonColor,
                  ),
                  Padding(padding: EdgeInsets.fromLTRB(0, 80, 0, 0)),

                  Container(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 6,
                          child: CalculateButton(
                              title: "Re-Calc",
                              buttonbackcolor: Color.fromRGBO(
                                  8, 97, 231, 0.14901960784313725),
                              buttontextcolor: kButtonColor,
                              onTap: () {
                                Navigator.pop(context);
                              }),
                        ),
                        Spacer(
                          flex: 1,
                        ),
                        Expanded(
                          flex: 6,
                          child: CalculateButton(
                              title: "Continue",
                              buttonbackcolor: kButtonColor,
                              buttontextcolor: Colors.white,
                              onTap: () {
                                Navigator.of(context).push(
                                    MaterialPageRoute(builder: (v)=> HomePageScreen())
                                );
                              }),
                        ),
                        // Spacer(
                        //   flex: 1,
                        // ),
                      ],
                    ),
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
