import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gradproj/widgets/button.dart';
import 'package:gradproj/widgets/calender.dart';
import 'package:gradproj/widgets/custom_textfield.dart';
import 'package:gradproj/widgets/custom_timepicker&cupertinoPicker.dart';
import 'package:gradproj/widgets/dropdownlist.dart';
import '../../theme/constants.dart';
import '../../widgets/text.dart';

class A1cPLUS extends StatefulWidget {
  const A1cPLUS({super.key});

  @override
  State<A1cPLUS> createState() => _A1cPLUSState();
}

List<String> a1c_items = ["1", "2", "3", "4", "5", "6"];
int index=0;
class _A1cPLUSState extends State<A1cPLUS> {
  TextEditingController a1c_controller = TextEditingController();
  TextEditingController eAg_controller = TextEditingController();

  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          foregroundColor: Colors.white,
          backgroundColor: kButtonColor,
          title: TextTitle(
                  text: 'A1C',
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
                    text: 'A1C percentage',
                    textcolor: Colors.black,
                    weight: FontWeight.bold,
                  )
                  ]),
               Row(
                 children: [
              CustomTextField(
                hintText: '',
                controller: a1c_controller,
                isPassword: false,
                padding_left: 0,
                padding_top: 15,
                padding_right: 0,
                padding_bottom: 15,
              )]),
              Row(
                children: [
              SubTitle(
                text: 'eAg percentage',
                textcolor: Colors.black,
                weight: FontWeight.bold,
              )]),
              Row(
                children: [
              CustomTextField(
                hintText: '',
                controller: eAg_controller,
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
                Calender(),
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
                CustomTimePicker(cancle_text: 'Cancel',),
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
                          items: a1c_items, month_or_year: ' months',
                          selected: '3',
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

