import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gradproj/core/widgets/style.dart';
import '../../theme/constants.dart';
import '../../widgets/text.dart';

class MedicalTestsReport extends StatefulWidget {
  @override
  MedicalTestsReportState createState() => MedicalTestsReportState();
}

class MedicalTestsReportState extends State<MedicalTestsReport> {
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

        List<Map<String, dynamic>> postprandialTests =
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
                  itemCount: postprandialTests.length,
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
                                      'blood sugar: ${postprandialTests[index]['bloodSugar']} mg/dL',
                                  textcolor: kButtonColor,
                                  weight: FontWeight.bold,
                                ),
                                SmallText(
                                  text: 'date: ${postprandialTests[index]['date']}',
                                  textcolor: kButtonColor,
                                  weight: FontWeight.bold,
                                ),
                              ],
                            ),
                            const Spacer(),
                            SmallText(
                              text: 'time: ${postprandialTests[index]['time']}',
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

        List<Map<String, dynamic>> lftTests =
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
                  itemCount: lftTests.length,
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
                                      'ALT: ${lftTests[index]['ALT_percentage']} UI/l ',
                                  textcolor: kButtonColor,
                                  weight: FontWeight.bold,
                                ),
                                SmallText(
                                  text:
                                      'AST: ${lftTests[index]['AST_percentage']} UI/l ',
                                  textcolor: kButtonColor,
                                  weight: FontWeight.bold,
                                ),
                                SmallText(
                                  text: 'date: ${lftTests[index]['date']}',
                                  textcolor: kButtonColor,
                                  weight: FontWeight.bold,
                                ),
                              ],
                            ),
                            const Spacer(),
                            SmallText(
                              text: 'time: ${lftTests[index]['time']}',
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
