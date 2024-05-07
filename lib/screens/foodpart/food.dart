import 'package:flutter/material.dart';
import 'package:gradproj/screens/diabetes_info/some_information.dart';
import 'package:gradproj/screens/foodpart/meals.dart';
import 'package:gradproj/screens/medicaltests/MedicalTests.dart';
import 'package:gradproj/screens/medicine/medicine1.dart';
import 'package:gradproj/screens/sports/sports.dart';
import 'package:gradproj/theme/constants.dart';
import 'package:gradproj/widgets/calender.dart';
import 'package:gradproj/widgets/image.dart';
import 'package:gradproj/widgets/text.dart';


class FoodScreen extends StatefulWidget {
  @override
  _FoodScreenState createState() => _FoodScreenState();
}

class _FoodScreenState extends State<FoodScreen> {
  int _currentIndex = 0;
  final List<String> photoPaths = [
    'images/breakfast.jpg',
    'images/lunch.jpg',
    'images/diner.jpg',
    'images/snacks.jpg',
  ];

  final List<String> photoTexts = [
    'Breakfast',
    'Lunch',
    'Dinner',
    'Snacks',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: TextTitle(
            text: 'Food',
            textcolor: Colors.black,
          )
      ),
      body: Expanded(
              child: ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 16.0,vertical: 15),
                  itemCount: photoPaths.length,
                  itemBuilder: (context , index){
                    _currentIndex = index;
                    return Padding(
                        padding: EdgeInsets.only(top: 20),
                        child: CustomRoundedImage(
                          imagesrc: photoPaths[_currentIndex],
                          action: (){
                            Navigator.of(context).push(
                              MaterialPageRoute(builder: (v) => Meals(pageIndex: index))
                            );
                          },
                          text: photoTexts[_currentIndex],
                        ));
                  }
              )),

    );
  }
}


