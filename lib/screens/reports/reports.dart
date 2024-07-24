import 'package:flutter/material.dart';
import 'package:gradproj/screens/reports/sports_report.dart';
import 'package:gradproj/widgets/cards.dart';
import 'package:gradproj/widgets/text.dart';
import 'food_report.dart';
import 'medicaltest_report.dart';
import 'medicine_report.dart';

class Reports extends StatefulWidget {
  const Reports({super.key});

  @override
  ReportsState createState() => ReportsState();
}

class ReportsState extends State<Reports> {
  int _currentIndex = 0;
  List<String> items = ['Sports', 'Food', 'Medicine', 'Medical Tests'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const TextTitle(
          text: 'Reports',
          textcolor: Colors.black,
        ),
      ),
      body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            _currentIndex = index;
            return CustomCard(
              card_content: Padding(
                  padding: const EdgeInsets.only(left: 20, top: 20),
                  child: SubTitle(
                    text: items[_currentIndex],
                    textcolor: Colors.black,
                    weight: FontWeight.normal,
                  )),
              card_height: 80,
              card_action: () {
                if (index == 0) {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (v) => const SportsReport()));
                } else if (index == 1) {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (v) => const FoodReport()));
                } else if (index == 2) {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (v) => const MedicineReport()));
                } else if (index == 3) {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (v) => MedicalTestsReport()));
                }
              },
            );
          }),
    );
  }
}
