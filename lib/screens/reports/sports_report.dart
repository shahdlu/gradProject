// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gradproj/theme/constants.dart';
import 'package:intl/intl.dart';
import 'package:gradproj/widgets/calender.dart';
import '../../widgets/text.dart';

class SportsReport extends StatefulWidget {
  const SportsReport({super.key});

  @override
  SportsReportState createState() => SportsReportState();
}

class SportsReportState extends State<SportsReport> {
  DateTime selectedDate = DateTime.now();
  List<Map<String, dynamic>> sportData = [];

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  void _fetchData() async {
    final userId = FirebaseAuth.instance.currentUser!.uid;
    final docRef =
        FirebaseFirestore.instance.collection('sports_report').doc(userId);

    docRef.get().then((doc) {
      if (doc.exists) {
        final data = doc.data();
        setState(() {
          sportData = List<Map<String, dynamic>>.from(data!['entries'] ?? []);
        });
      }
    }).catchError((error) {
      print("Error fetching document: $error");
    });
  }

  List<Map<String, dynamic>> _getFilteredData() {
    final selectedDateString = DateFormat('M/d/yyyy').format(selectedDate);
    final filteredData = sportData
        .where((entry) => entry['date'] == selectedDateString)
        .toList();

    filteredData.sort((a, b) {
      const order = ['Walking', 'Dancing', 'Workout'];
      return order.indexOf(a['sport']).compareTo(order.indexOf(b['sport']));
    });

    return filteredData;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const TextTitle(text: 'Sports', textcolor: Colors.black),
      ),
      body: _reportPageWidget(),
    );
  }

  Widget _reportPageWidget() {
    final filteredData = _getFilteredData();
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 30, 0, 20),
          child: Row(children: [
            const SubTitle(
              text: 'select date',
              textcolor: Colors.black,
              weight: FontWeight.bold,
            ),
            Padding(
                padding: const EdgeInsets.only(left: 0),
                child: Calender(
                  onDateChanged: (value) {
                    setState(() {
                      selectedDate = value;
                    });
                  },
                )),
          ]),
        ),
        Column(
          children: [
            const SubTitle(
                text: 'Total',
                textcolor: Colors.black,
                weight: FontWeight.bold),
            Padding(
              padding: const EdgeInsets.only(bottom: 25),
              child: SmallText(
                text:
                    '${filteredData.fold<num>(0, (sum, entry) => sum + (entry['kcal'] is int ? entry['kcal'] : int.tryParse(RegExp(r'\d+').stringMatch(entry['kcal']) ?? '0') ?? 0))} KCal',
                textcolor: Colors.red,
                weight: FontWeight.bold,
              ),
            ),
          ],
        ),
        Expanded(
          child: ListView.builder(
              itemCount: filteredData.length,
              itemBuilder: (context, index) {
                final entry = filteredData[index];
                final sportKind = entry['name'] ?? 'Unknown';
                final sportKcal = entry['kcal'] ?? '0';

                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    padding: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color: Colors.black,
                          width: 1,
                        )),
                    child: Column(children: [
                      Row(children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SmallText(
                              text: 'sport: ${entry['sport']}',
                              textcolor: kButtonColor,
                              weight: FontWeight.bold,
                            ),
                            SmallText(
                              text: 'kind: $sportKind',
                              textcolor: kButtonColor,
                              weight: FontWeight.bold,
                            ),
                          ],
                        ),
                        const Spacer(),
                        SmallText(
                          text: '$sportKcal KCal',
                          textcolor: Colors.red,
                          weight: FontWeight.bold,
                        ),
                      ]),
                    ]),
                  ),
                );
              }),
        ),
      ],
    );
  }
}
