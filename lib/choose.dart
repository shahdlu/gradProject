
import 'package:flutter/material.dart';
import 'package:gradproj/screens/result.dart';
import 'package:gradproj/widgets/calculate_button.dart';
import '../constants.dart';
import 'calculator_brain.dart';

var exerciseList = [
  "Little to no exercise",
  "Light exercise\n(1–3 days per week)",
  "Moderate exercise\n(3–5 days per week)",
  "Heavy exercise\n(6–7 days per week)",
  "Exercise\n(twice per day)"
];

class AimPage extends StatefulWidget {
  const AimPage({super.key, this.age, this.weight, this.height, this.gender});

  final age, weight, height;
  final gender;

  @override
  _AimPageState createState() => _AimPageState();
}

class _AimPageState extends State<AimPage> {
  String _activity = exerciseList[0];

  late int age, weight, height;
  late bool gender;

  @override
  void initState() {
    height = widget.height;
    weight = widget.weight;
    age = widget.age;
    gender = widget.gender;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Calories calculator",
          style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
        ),
        centerTitle: true,
        backgroundColor: kButtonColor,
      ),
      body: SizedBox(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Choose Activity Level",
                      style: TextStyle(
                        fontSize: 30,
                        color: const Color.fromARGB(255, 0, 0, 0),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 15),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(25),
                          boxShadow: kBoxShadow,
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Radio(
                              activeColor: kButtonColor,
                              value: exerciseList[0],
                              groupValue: _activity,
                              onChanged: ((value) {
                                setState(() {
                                  _activity = value!;
                                });
                              }),
                            ),
                            Text(
                              exerciseList[0],
                              style: TextStyle(
                                fontSize: 20,
                                color: kButtonColor,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 15),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(25),
                          boxShadow: kBoxShadow,
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Radio(
                              activeColor: kButtonColor,
                              value: exerciseList[1],
                              groupValue: _activity,
                              onChanged: ((value1) {
                                setState(() {
                                  _activity = value1!;
                                });
                              }),
                            ),
                            Text(
                              exerciseList[1],
                              style: TextStyle(
                                fontSize: 20,
                                color: kButtonColor,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 15),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(25),
                          boxShadow: kBoxShadow,
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Radio(
                              activeColor: kButtonColor,
                              value: exerciseList[2],
                              groupValue: _activity,
                              onChanged: ((value2) {
                                setState(() {
                                  _activity = value2!;
                                });
                              }),
                            ),
                            Text(
                              exerciseList[2],
                              style: TextStyle(
                                fontSize: 20,
                                color: kButtonColor,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 15),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(25),
                          boxShadow: kBoxShadow,
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Radio(
                              activeColor: kButtonColor,
                              value: exerciseList[3],
                              groupValue: _activity,
                              onChanged: ((value3) {
                                setState(() {
                                  _activity = value3!;
                                });
                              }),
                            ),
                            Text(
                              exerciseList[3],
                              style: TextStyle(
                                fontSize: 20,
                                color: kButtonColor,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 15),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(25),
                          boxShadow: kBoxShadow,
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Radio(
                              activeColor: kButtonColor,
                              value: exerciseList[4],
                              groupValue: _activity,
                              onChanged: ((value4) {
                                setState(() {
                                  _activity = value4!;
                                });
                              }),
                            ),
                            Text(
                              exerciseList[4],
                              style: TextStyle(
                                fontSize: 20,
                                color: kButtonColor,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 10, right: 25, bottom: 10),
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
                                activity: _activity,
                              );

                              print(_activity);

                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ResultScreen(
                                    bmrResult: calculatorBrain.result(),
                                    icon: calculatorBrain.getGenderIcon(),
                                    bmiResult: calculatorBrain.getBMIResult(),
                                    currentCalorie:
                                        calculatorBrain.getActivity(),
                                  ),
                                ),
                              );
                            }),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
