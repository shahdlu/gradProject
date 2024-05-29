import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gradproj/widgets/cards.dart';
import 'package:gradproj/widgets/icons.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

import '../../theme/constants.dart';
import '../../widgets/text.dart';
import 'A1CPLUS.dart';

class A1c extends StatefulWidget {
  @override
  State<A1c> createState() => _A1cState();
}

class _A1cState extends State<A1c> {
  int _current_index = 0;
  List<Map<String, dynamic>> a1cTests = [];

  @override
  void initState() {
    super.initState();
    fetchA1cData();
  }

  Future<void> fetchA1cData() async {
    try {
      String userId = FirebaseAuth.instance.currentUser!.uid;
      DocumentSnapshot userDoc = await FirebaseFirestore.instance.collection('A1C').doc(userId).get();

      if (userDoc.exists) {
        setState(() {
          a1cTests = List<Map<String, dynamic>>.from(userDoc['tests']);
        });
      } else {
        // Handle case where document does not exist
        print('No A1C data found for the user.');
      }
    } catch (e) {
      // Handle any errors that occur during the fetch
      print('Failed to fetch A1C data: $e');
    }
  }

  Future<void> deleteTest(int index) async {
    try {
      String userId = FirebaseAuth.instance.currentUser!.uid;
      a1cTests.removeAt(index);
      await FirebaseFirestore.instance.collection('A1C').doc(userId).update({'tests': a1cTests});
      setState(() {});
    } catch (e) {
      print('Failed to delete A1C test: $e');
    }
  }

  Future<void> generatePdf() async {
    final pdf = pw.Document();
    pdf.addPage(
      pw.Page(
        build: (pw.Context context) {
          return pw.Column(
            children: a1cTests.map((test) {
              return pw.Container(
                margin: const pw.EdgeInsets.only(bottom: 20),
                padding: const pw.EdgeInsets.all(10),
                decoration: pw.BoxDecoration(
                  border: pw.Border.all(color: PdfColors.black),
                  borderRadius: pw.BorderRadius.circular(10),
                ),
                child: pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Text('Date: ${test['date']}', style: pw.TextStyle(fontSize: 18)),
                    pw.Text('Time: ${test['time']}', style: pw.TextStyle(fontSize: 18)),
                    pw.Text('A1C: ${test['a1c_percentage']}%', style: pw.TextStyle(fontSize: 18)),
                    pw.Text('eAg: ${test['eAg_percentage']} mmol', style: pw.TextStyle(fontSize: 18)),
                  ],
                ),
              );
            }).toList(),
          );
        },
      ),
    );

    await Printing.sharePdf(bytes: await pdf.save(), filename: 'a1c_report.pdf');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: kButtonColor,
        title: Row(
          children: [
            TextTitle(
              text: 'A1C',
              textcolor: Colors.white,
            ),
            GestureDetector(
              onTap: generatePdf,
              child: Container(
                padding: EdgeInsets.only(left: 200),
                child: Icon(
                  Icons.download_sharp,
                  color: Colors.white,
                  size: 25,
                ),
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: a1cTests.length,
              itemBuilder: (context, index) {
                _current_index = index;
                return CustomCard(
                  card_content: _content(index),
                  card_height: 150,
                  card_action: () {},
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 30),
            child: RawMaterialButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => A1cPLUS(),
                ));
              },
              elevation: 2.0,
              fillColor: kButtonColor,
              child: Icon(
                Icons.add,
                color: Color.fromARGB(255, 255, 255, 255),
                size: 35.0,
              ),
              padding: EdgeInsets.all(15.0),
              shape: CircleBorder(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _content(int index) {
    var test = a1cTests[index];
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 15, left: 20),
          child: Row(
            children: [
              NormalText(
                text: test['date'],
                textcolor: Colors.black,
                weight: FontWeight.normal,
              ),
              Padding(
                padding: EdgeInsets.only(left: 50),
                child: NormalText(
                  text: test['time'],
                  textcolor: Colors.black,
                  weight: FontWeight.normal,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: SmallIcon(
                  icon_name: Icons.delete,
                  action: () async {
                    await deleteTest(index);
                  },
                ),
              ),
            ],
          ),
        ),
        Row(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 1),
              child: Row(
                children: [
                  Image.asset(
                    'images/testimg.jpg',
                    width: 100,
                    height: 100,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(right: 100),
                              child: NormalText(
                                text: 'A1C',
                                textcolor: kButtonColor,
                                weight: FontWeight.normal,
                              ),
                            ),
                            NormalText(
                              text: test['a1c_percentage'] + ' %',
                              textcolor: kButtonColor,
                              weight: FontWeight.normal,
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(right: 60),
                              child: NormalText(
                                text: 'eAg',
                                textcolor: kButtonColor,
                                weight: FontWeight.normal,
                              ),
                            ),
                            NormalText(
                              text: test['eAg_percentage'] + ' mmol',
                              textcolor: kButtonColor,
                              weight: FontWeight.normal,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
