import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gradproj/theme/constants.dart';
import 'package:gradproj/widgets/button.dart';
import 'package:gradproj/widgets/text.dart';
import 'package:intl/intl.dart';
import '../../widgets/vedio.dart';

class CounterTrainings extends StatefulWidget {
  final String link;
  final String trainingName;
  final String? kcal;
  final String? sport;

  const CounterTrainings(
      {Key? key,
      required this.link,
      required this.trainingName,
      this.kcal,
      this.sport})
      : super(key: key);
  @override
  State<CounterTrainings> createState() => _CounterTrainingsState();
}

class _CounterTrainingsState extends State<CounterTrainings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: TextTitle(
            text: widget.trainingName,
            textcolor: Colors.black,
          ),
        ),
        body: SingleChildScrollView(
          child: Column(children: [
            Container(
                padding: const EdgeInsets.fromLTRB(20, 150, 20, 100),
                height: 600,
                width: 700,
                child: VideoPlayerWidget(
                  link: widget.link,
                )),
            CalculateButton(
              title: 'Done',
              onTap: () async {
                final kcalString = widget.kcal ?? '0';
                final kcal = int.tryParse(
                        RegExp(r'\d+').stringMatch(kcalString) ?? '0') ??
                    0;

                final newEntry = {
                  'name': widget.trainingName,
                  'date': DateFormat('M/d/yyyy').format(DateTime.now()), 
                  'kcal': kcal,
                  'sport': widget.sport ?? '',
                };

                final userId = FirebaseAuth.instance.currentUser!.uid;
                final docRef = FirebaseFirestore.instance
                    .collection('sports_report')
                    .doc(userId);

                docRef.get().then((doc) {
                  if (doc.exists) {
                    docRef.update({
                      'entries': FieldValue.arrayUnion([newEntry]),
                    });
                  } else {
                    docRef.set({
                      'entries': [newEntry],
                    });
                  }
                }).then((_) {
                  Navigator.pop(context);
                }).catchError((error) {
                  // Handle error
                  print("Error updating document: $error");
                });
              },
              buttonbackcolor: kButtonColor,
              buttontextcolor: Colors.white,
            ),
          ]),
        ));
  }
}
