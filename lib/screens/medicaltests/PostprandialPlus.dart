import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gradproj/widgets/button.dart';
import 'package:gradproj/widgets/calender.dart';
import 'package:gradproj/widgets/custom_textfield.dart';
import 'package:gradproj/widgets/custom_timepicker&cupertinoPicker.dart';
import 'package:gradproj/widgets/dropdownlist.dart';
import '../../theme/constants.dart';
import '../../widgets/text.dart';

class PostprandialPlus extends StatefulWidget {
  const PostprandialPlus({super.key});

  @override
  State<PostprandialPlus> createState() => _PostprandialPlusState();
}
int index=0;
class _PostprandialPlusState extends State<PostprandialPlus> {
  TextEditingController bloodsugar_controller = TextEditingController();
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            foregroundColor: Colors.white,
            backgroundColor: kButtonColor,
            title: TextTitle(
              text: 'Postprandal blood',
              textcolor: Colors.white,
            )
        ),
        body:  SingleChildScrollView(
            child: Padding(
                padding: EdgeInsets.all(30),
                child: Column(
                  children: [
                    Row(
                        children: [
                          SubTitle(
                            text: 'Blood sugar percentage',
                            textcolor: Colors.black,
                            weight: FontWeight.bold,
                          )
                        ]),
                    Row(
                        children: [
                          CustomTextField(
                            hintText: '',
                            controller: bloodsugar_controller,
                            isPassword: false,
                            padding_left: 0,
                            padding_top: 15,
                            padding_right: 0,
                            padding_bottom: 15,
                          )]),
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: Row(
                          children: [
                            SubTitle(
                                text: 'Date',
                                textcolor: Colors.black,
                                weight: FontWeight.bold
                            ),
                          ]),
                    ),
                    Row(
                        children: [
                          Calender(onDateChanged: (value) {
                            
                          },),
                        ]),
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: Row(
                          children: [
                            SubTitle(
                                text: 'Time',
                                textcolor: Colors.black,
                                weight: FontWeight.bold
                            ),
                          ]),
                    ),
                    Padding(
                        padding: EdgeInsets.only(left: 30),
                        child: Row(
                            children: [
                              CustomTimePicker(cancle_text: 'Cancel', onTimeChanged: (TimeOfDay value) {  },),
                            ])),
                    Padding(
                        padding: EdgeInsets.only(top: 200),
                        child: CalculateButton(
                            title: 'Save',
                            onTap: () {

                            },
                            buttonbackcolor: kButtonColor,
                            buttontextcolor: Colors.white
                        ))
                  ],
                )
            )));
  }
}

