import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gradproj/widgets/button.dart';
import 'package:gradproj/widgets/calender.dart';
import 'package:gradproj/widgets/custom_textfield.dart';
import 'package:gradproj/widgets/custom_timepicker&cupertinoPicker.dart';
import 'package:gradproj/widgets/dropdownlist.dart';
import '../../theme/constants.dart';
import '../../widgets/text.dart';

class LFT_PLUS extends StatefulWidget {
  const LFT_PLUS({super.key});

  @override
  State<LFT_PLUS> createState() => _LFT_PLUSState();
}


List<String> lft_items = ["1", "2", "3", "4", "5"];
int index=0;
class _LFT_PLUSState extends State<LFT_PLUS> {
  TextEditingController ALT_controller = TextEditingController();
  TextEditingController AST_controller = TextEditingController();

  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            foregroundColor: Colors.white,
            backgroundColor: kButtonColor,
            title: TextTitle(
              text: 'LFT',
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
                            text: 'ALT percentage',
                            textcolor: Colors.black,
                            weight: FontWeight.bold,
                          )
                        ]),
                    Row(
                        children: [
                          CustomTextField(
                            hintText: '',
                            controller: ALT_controller,
                            isPassword: false,
                            padding_left: 0,
                            padding_top: 15,
                            padding_right: 0,
                            padding_bottom: 15,
                          )]),
                    Row(
                        children: [
                          SubTitle(
                            text: 'AST percentage',
                            textcolor: Colors.black,
                            weight: FontWeight.bold,
                          )]),
                    Row(
                        children: [
                          CustomTextField(
                            hintText: '',
                            controller: AST_controller,
                            isPassword: false,
                            padding_left: 0,
                            padding_top: 15,
                            padding_right: 0,
                            padding_bottom: 0,
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
                              CustomTimePicker(cancle_text: 'Cancel',onTimeChanged: (value) {
                                
                              },),
                            ])),
                    Padding(
                        padding: EdgeInsets.only(top: 15),
                        child: Row(
                            children: [
                              SubTitle(
                                  text: 'Duration between each test',
                                  textcolor: Colors.black,
                                  weight: FontWeight.bold
                              )
                            ])),
                    Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: Row(
                            children: [
                              CustomDropDownlist(
                                selected: '1', items: lft_items, month_or_year: ' years',
                                onChanged: (value) {
                                  
                                },
                              )])),
                    Padding(
                        padding: EdgeInsets.only(top: 20),
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

