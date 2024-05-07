
import 'package:flutter/material.dart';
import 'package:gradproj/widgets/button.dart';
import 'package:gradproj/widgets/custom_textfield.dart';
import '../../theme/constants.dart';
import '../../widgets/custom_timepicker&cupertinoPicker.dart';
import '../../widgets/text.dart';
import 'CounterView .dart';
import 'medicine1.dart';

class Add_med extends StatefulWidget {
  @override
  _Add_medState createState() => _Add_medState();
  }

  class _Add_medState extends State<Add_med> {
  TextEditingController pill_name= TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: kButtonColor,
        title: TextTitle(
          text: 'Add medicine',
          textcolor: Colors.white,
        ),
      ),
      body: SingleChildScrollView(
      child: Padding(
        padding:  EdgeInsets.all(30),
      child: Column(
        children: [
          Row(
            children: [
               SubTitle(
              text: "Pills name",
              textcolor: Colors.black,
              weight: FontWeight.bold,
            )
      ]),
Row(
  children: [
 CustomTextField(
              hintText: '',
              controller: pill_name,
              isPassword: false,
              padding_left: 0,
              padding_top: 20,
              padding_right: 0,
              padding_bottom: 40,

            )]),
          Row(
                children: [
              SubTitle(
                text: "Dosage",
                textcolor: Colors.black,
                weight: FontWeight.bold,
              ),
          Padding(
              padding: EdgeInsets.only( left: 90),
              child: CounterScreen())
          ]),
          Padding(
            padding: EdgeInsets.only(top: 30),
            child: Row(
              children: [
                SubTitle(
                  text: "Time of dosages",
                  textcolor: Colors.black,
                  weight: FontWeight.bold,
            )])),
          Padding(
            padding: EdgeInsets.only(top: 15),
          child: Row(
              children: [
          SubTitle(
            text: "First",
            textcolor: Colors.black,
            weight: FontWeight.normal,
          ),
          Padding(
              padding: EdgeInsets.only(left: 80),
              child: CustomTimePicker(cancle_text: 'Not Found',)
          )])),
          Padding(
              padding: EdgeInsets.only(top: 15),
              child: Row(
                  children: [
                    SubTitle(
                      text: "Second",
                      textcolor: Colors.black,
                      weight: FontWeight.normal,
                    ),
                    Padding(
                        padding: EdgeInsets.only(left: 46),
                        child: CustomTimePicker(cancle_text: 'Not Found',)
                    )])),
          Padding(
              padding: EdgeInsets.only(top: 15),
              child: Row(
                  children: [
                    SubTitle(
                      text: "Third",
                      textcolor: Colors.black,
                      weight: FontWeight.normal,
                    ),
                    Padding(
                        padding: EdgeInsets.only(left: 70),
                        child: CustomTimePicker(cancle_text: 'Not Found',)
                    )])),
            Padding(
                padding: EdgeInsets.only(top: 60),
            child: CalculateButton(
                title: 'Save',
                onTap: (){

                },
                buttonbackcolor: kButtonColor,
                buttontextcolor: Colors.white
            ))

        ],
      ),
    )));
  }
}
