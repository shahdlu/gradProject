import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gradproj/theme/constants.dart';
import 'package:gradproj/widgets/button.dart';
import 'package:gradproj/widgets/cards.dart';
import 'package:gradproj/widgets/custom_checkbox.dart';
import 'package:gradproj/widgets/text.dart';
import '../../widgets/icons.dart';
import '../../widgets/image.dart';
import 'add_medicine.dart';

class Medicine extends StatefulWidget {
  const Medicine({super.key});

  @override
  State<Medicine> createState() => _MedicineState();
}

class _MedicineState extends State<Medicine> {
  int _current_index = 0;
  List<String> items = ['omega3', 'add'];
  List<String> first_dosage = ['8:00 AM', '10:00 AM'];
  List<String> second_dosage = ['2:00 PM', '10:00 PM'];
  List<String> third_dosage = ['10:00 PM','Not Found'];
  List<double> dosage = [2,1];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
         body: TopImage(
           imagesrc: 'images/medicinebackimg.jpg',
           widget: med_widget(),
           title: 'Medicine',
         ),
    );
  }
  Widget med_widget(){
    return Column(
        children: [
          Padding(
              padding: EdgeInsets.only(top: 20),
          child: TextTitle(
              text: 'Daily review',
              textcolor: kButtonColor
          )),
       SizedBox(
         height: 350,
                      child: ListView.builder(
                        itemCount: items.length,
                      itemBuilder: (context,index){
                        _current_index = index;
                        return  CustomCard(
                        card_content: Padding(
                            padding: EdgeInsets.all(20),
                        child: Column(
                            children: [
                             Row(
                          children: [
                             SubTitle(
                          text: items[_current_index],
                          textcolor: Colors.black,
                          weight: FontWeight.normal,
                        ),
                            Spacer(flex: 1,),
                            GestureDetector(
                              onTap: (){

                              },
                                child: SmallIcon(
                                icon_name: Icons.delete,
                                action: (){

                                }
                            ))
                            ]),

                                SizedBox(
                                  height: 170,
                            child: Column(
                              children: [
                                CustomCheckbox(
                                  checkbox_title: first_dosage[_current_index],
                                  checkboxtitle_widget: SmallText(
                                    text: first_dosage[_current_index],
                                    textcolor: Colors.black,
                                    weight: FontWeight.normal,
                                  ),
                                ),
                                CustomCheckbox(
                                  checkbox_title: second_dosage[_current_index],
                                  checkboxtitle_widget: SmallText(
                                    text: second_dosage[_current_index],
                                    textcolor: Colors.black,
                                    weight: FontWeight.normal,
                                  ),),
                                CustomCheckbox(
                                  checkbox_title: third_dosage[_current_index],
                                  checkboxtitle_widget: SmallText(
                                    text: third_dosage[_current_index],
                                    textcolor: Colors.black,
                                    weight: FontWeight.normal,
                                  ),
                                ),
                               ],)),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Padding(
                                      padding: EdgeInsets.only(top: 30),
                                      child: SmallText(
                                          text: 'Dosage: '+dosage[_current_index].toString(),
                                          textcolor: Colors.black,
                                          weight: FontWeight.normal
                                      ))]),


                               ])),
                        card_height: 320,
                        card_action: (){
                          MaterialPageRoute(
                              builder: (context) =>  Add_med(),
                          );
                        }
                        );
                        }
            )),
          Padding(
            padding: EdgeInsets.only(top: 80),
          child: CalculateButton(
              title: 'Add new medicine',
              onTap: (){
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (e)=> Add_med())
                );
              },
              buttonbackcolor: kButtonColor,
              buttontextcolor: Colors.white
          ))
    ]);
  }
}