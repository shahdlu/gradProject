import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gradproj/theme/constants.dart';
import 'package:gradproj/widgets/cards.dart';
import 'package:intl/intl.dart';
import 'package:gradproj/widgets/calender.dart';
import '../../widgets/text.dart';

class MedicineReport extends StatefulWidget {
  const MedicineReport({super.key});

  @override
  MedicineReportState createState() => MedicineReportState();
}

class MedicineReportState extends State<MedicineReport> {
  DateTime selectedDate = DateTime.now();
  List<Map<String, dynamic>> medicineData = [];

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  void _fetchData() async {
    final userId = FirebaseAuth.instance.currentUser!.uid;
    final docRef =
        FirebaseFirestore.instance.collection('medicine').doc(userId);

    docRef.get().then((doc) {
      if (doc.exists) {
        final data = doc.data();
        setState(() {
          medicineData =
              List<Map<String, dynamic>>.from(data!['medicines'] ?? []);
        });
      }
    }).catchError((error) {
      print("Error fetching document: $error");
    });
  }

  List<Map<String, dynamic>> _getFilteredData() {
    final selectedDateString = DateFormat('M/d/yyyy').format(selectedDate);
    return medicineData
        .where((entry) => entry['date'] == selectedDateString)
        .toList();
  }

  bool _allMedicinesTaken(List<Map<String, dynamic>> data) {
    for (var entry in data) {
      List<dynamic> times = entry['times'];
      bool allTimesTaken =
          times.every((timeEntry) => timeEntry['isTaken'] ?? false);
      if (!allTimesTaken) {
        return false;
      }
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    final filteredData = _getFilteredData();
    final allTaken = _allMedicinesTaken(filteredData);

    return Scaffold(
      appBar: AppBar(
        title:
            const TextTitle(text: 'Medicine Report', textcolor: Colors.black),
      ),
      body: _reportPageWidget(filteredData, allTaken),
    );
  }

  Widget _reportPageWidget(
      List<Map<String, dynamic>> filteredData, bool allTaken) {
    return Column(children: [
      Padding(
        padding: const EdgeInsets.fromLTRB(20, 30, 0, 20),
        child: Row(
          children: [
            const SubTitle(
              text: 'Select date',
              textcolor: Colors.black,
              weight: FontWeight.bold,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Calender(
                onDateChanged: (value) {
                  setState(() {
                    selectedDate = value;
                  });
                },
              ),
            ),
          ],
        ),
      ),
      if (filteredData.isNotEmpty)
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                allTaken ? Icons.check_circle : Icons.highlight_remove,
                color: allTaken ? Colors.green : Colors.red,
              ),
              const SizedBox(width: 10),
              Text(
                allTaken
                    ? 'All medicines have been taken'
                    : 'Some medicines are not taken',
                style: TextStyle(
                  color: allTaken ? Colors.green : Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      CustomCard(
          card_action: () {},
          card_height: 570,
          card_content: Padding(
              padding: const EdgeInsets.only(right: 30),
              child: Column(
                children: [
                  const Padding(
                      padding: EdgeInsets.only(left: 30, top: 20),
                      child: Row(children: [
                        SmallText(
                          text: 'Medicine',
                          textcolor: Colors.black,
                          weight: FontWeight.bold,
                        ),
                        Spacer(
                          flex: 1,
                        ),
                        SmallText(
                          text: 'Dosage',
                          textcolor: Colors.black,
                          weight: FontWeight.bold,
                        ),
                        Spacer(
                          flex: 2,
                        ),
                      ])),
                  SizedBox(
                    height: 450,
                    child: ListView.builder(
                        itemCount: filteredData.length,
                        itemBuilder: (context, index) {
                          final medicine = filteredData[index];
                          final medicineName =
                              medicine['pill_name'] ?? 'medicine';
                          final medicineDose = medicine['dosage'] ?? '0';
                          final bool isAllTimesTaken =
                              (medicine['times'] as List<dynamic>).every(
                                  (timeEntry) => timeEntry['isTaken'] ?? false);

                          return Padding(
                              padding: const EdgeInsets.only(left: 30, top: 20),
                              child: Row(
                                children: [
                                  SmallText(
                                    text: medicineName,
                                    textcolor: kButtonColor,
                                    weight: FontWeight.bold,
                                  ),
                                  const Spacer(
                                    flex: 1,
                                  ),
                                  SmallText(
                                    text: medicineDose.toString(),
                                    textcolor: kButtonColor,
                                    weight: FontWeight.bold,
                                  ),
                                  const Spacer(
                                    flex: 1,
                                  ),
                                  Icon(
                                    isAllTimesTaken
                                        ? Icons.check_circle
                                        : Icons.highlight_remove,
                                    color: isAllTimesTaken
                                        ? Colors.green
                                        : Colors.red,
                                  )
                                ],
                              ));
                        }),
                  )
                ],
              )))
    ]);
  }
}
