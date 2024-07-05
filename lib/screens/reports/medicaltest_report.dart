import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gradproj/core/widgets/style.dart';
import 'package:gradproj/widgets/button.dart';

import '../../theme/constants.dart';
import '../../widgets/cards.dart';
import '../../widgets/text.dart';

class MedicalTestsReport extends StatefulWidget {
  @override
  _MedicalTestsReportState createState() => _MedicalTestsReportState();
}

class _MedicalTestsReportState extends State<MedicalTestsReport> {
  int _currentIndex = 0;
  List<String> test_name = ['A1C', 'A1C', 'Postprandial blood', 'LFT', 'LFT'];
  List<String> test_kind = ['A1C', 'eAg', 'Blood sugar', 'ALT', 'AST'];
  List<String> eAg_perc = ['7.0', '5.0'];
  List<String> a1c_perc = ['6', '20'];
  List<String> sugar_perc = ['200', '140', '150'];
  List<String> alt_perc = ['24'];
  List<String> ast_perc = ['42'];
  List<String> a1c_time = ['5 pm', '8 am'];
  List<String> postprandal_time = ['10 pm', '5 pm', '12 am'];
  List<String> lft_time = ['6 pm'];
  List<String> a1c_date = ['5-5-2024', '10-5-2024'];
  List<String> postprandal_date = ['8-30-2020', '6-12-2024', '9-6-2024'];
  List<String> lft_date = ['7-9-2024'];
  late List<String> test_perc;
  late List<String> test_time;
  late List<String> test_date;
  late String second_text;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const TextTitle(
          text: 'Medical Tests',
          textcolor: Colors.black,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            a1cBody(),
            postprandialBody(),
            lftBody(),
          ],
        ),
      ),
    );
  }

  StreamBuilder<DocumentSnapshot<Object?>> a1cBody() {
    return StreamBuilder<DocumentSnapshot>(
      stream: FirebaseFirestore.instance
          .collection('A1C')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (!snapshot.hasData || !snapshot.data!.exists) {
          return const SizedBox();
        }

        List<Map<String, dynamic>> a1cTests =
            List<Map<String, dynamic>>.from(snapshot.data!['tests']);

        return Column(
          children: [
            const Text(
              'A1C Tests',
              style: Styles.textStyle18,
            ),
            const SizedBox(height: 15),
            Container(
              height: 200,
              margin: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.black),
              ),
              child: Expanded(
                child: ListView.builder(
                  itemCount: a1cTests.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        padding: const EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(0),
                            border: const Border(
                              bottom: BorderSide(color: Colors.grey),
                            )),
                        child: Column(children: [
                          Row(children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SmallText(
                                  text:
                                      'eAg: ${a1cTests[index]['eAg_percentage']} mmol',
                                  textcolor: kButtonColor,
                                  weight: FontWeight.bold,
                                ),
                                SmallText(
                                  text: 'date: ${a1cTests[index]['date']}',
                                  textcolor: kButtonColor,
                                  weight: FontWeight.bold,
                                ),
                              ],
                            ),
                            const Spacer(),
                            SmallText(
                              text: 'time: ${a1cTests[index]['time']}',
                              textcolor: Colors.red,
                              weight: FontWeight.bold,
                            ),
                          ]),
                        ]),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  StreamBuilder<DocumentSnapshot<Object?>> postprandialBody() {
    return StreamBuilder<DocumentSnapshot>(
      stream: FirebaseFirestore.instance
          .collection('postprandial')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (!snapshot.hasData || !snapshot.data!.exists) {
          return const SizedBox();
        }

        List<Map<String, dynamic>> a1cTests =
            List<Map<String, dynamic>>.from(snapshot.data!['tests']);

        return Column(
          children: [
            const SizedBox(height: 15),
            const Text(
              'Postprandial Tests',
              style: Styles.textStyle18,
            ),
            const SizedBox(height: 15),
            Container(
              height: 200,
              margin: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.black),
              ),
              child: Expanded(
                child: ListView.builder(
                  itemCount: a1cTests.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        padding: const EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(0),
                            border: const Border(
                              bottom: BorderSide(color: Colors.grey),
                            )),
                        child: Column(children: [
                          Row(children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SmallText(
                                  text:
                                      'blood sugar: ${a1cTests[index]['bloodSugar']} mg/dL',
                                  textcolor: kButtonColor,
                                  weight: FontWeight.bold,
                                ),
                                SmallText(
                                  text: 'date: ${a1cTests[index]['date']}',
                                  textcolor: kButtonColor,
                                  weight: FontWeight.bold,
                                ),
                              ],
                            ),
                            const Spacer(),
                            SmallText(
                              text: 'time: ${a1cTests[index]['time']}',
                              textcolor: Colors.red,
                              weight: FontWeight.bold,
                            ),
                          ]),
                        ]),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  StreamBuilder<DocumentSnapshot<Object?>> lftBody() {
    return StreamBuilder<DocumentSnapshot>(
      stream: FirebaseFirestore.instance
          .collection('LFT')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (!snapshot.hasData || !snapshot.data!.exists) {
          return const SizedBox();
        }

        List<Map<String, dynamic>> a1cTests =
            List<Map<String, dynamic>>.from(snapshot.data!['tests']);

        return Column(
          children: [
            const SizedBox(height: 15),
            const Text(
              'LFT Tests',
              style: Styles.textStyle18,
            ),
            const SizedBox(height: 15),
            Container(
              height: 200,
              margin: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.black),
              ),
              child: Expanded(
                child: ListView.builder(
                  itemCount: a1cTests.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        padding: const EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(0),
                            border: const Border(
                              bottom: BorderSide(color: Colors.grey),
                            )),
                        child: Column(children: [
                          Row(children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SmallText(
                                  text:
                                      'ALT: ${a1cTests[index]['ALT_percentage']} UI/l ',
                                  textcolor: kButtonColor,
                                  weight: FontWeight.bold,
                                ),
                                SmallText(
                                  text:
                                      'AST: ${a1cTests[index]['AST_percentage']} UI/l ',
                                  textcolor: kButtonColor,
                                  weight: FontWeight.bold,
                                ),
                                SmallText(
                                  text: 'date: ${a1cTests[index]['date']}',
                                  textcolor: kButtonColor,
                                  weight: FontWeight.bold,
                                ),
                              ],
                            ),
                            const Spacer(),
                            SmallText(
                              text: 'time: ${a1cTests[index]['time']}',
                              textcolor: Colors.red,
                              weight: FontWeight.bold,
                            ),
                          ]),
                        ]),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
