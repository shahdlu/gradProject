import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gradproj/screens/data&bmr&bmi/datascreen.dart';
import 'package:gradproj/theme/constants.dart';
import 'package:gradproj/widgets/divider.dart';
import 'package:gradproj/widgets/icons.dart';
import 'package:gradproj/widgets/text.dart';
import 'package:firebase_auth/firebase_auth.dart';
class Settings extends StatefulWidget{
  @override
  State<Settings> createState() => _SettingsState();
}
class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
            appBar: AppBar(
                title: TextTitle(
                  text: 'Settings',
                  textcolor: Colors.black,
                )
            ),
            body: Padding(
            padding: EdgeInsets.only(left: 25, top: 25 ),
            child: Column(
              children: [
                LeftIconWithText(
                    icon_name: Icons.person,
                    text: 'User Name',
                     weight: FontWeight.bold
                ),
                Padding(
                    padding: EdgeInsets.only(left: 20,top: 20),
                child: Row(
                  children: [
                  Column(
                    children: [
                      NormalText(text: 'Gender\n', textcolor: kButtonColor, weight: FontWeight.normal,),
                      NormalText(text: 'Height\n', textcolor: kButtonColor, weight: FontWeight.normal,),
                      NormalText(text: 'Weight\n', textcolor: kButtonColor, weight: FontWeight.normal,),
                      NormalText(text: 'Age\n', textcolor: kButtonColor, weight: FontWeight.normal,),
                      NormalText(text: 'BMR\n', textcolor: kButtonColor, weight: FontWeight.normal,),
                      NormalText(text: 'BMI', textcolor: kButtonColor, weight: FontWeight.normal,),
                  ],),
                    Padding(
                      padding: EdgeInsets.only(left: 130),
                      child: Column(
                        children: [
                          NormalText(text: 'Male'+'\n', textcolor: kButtonColor, weight: FontWeight.normal,),
                          NormalText(text: '177'+' cm\n', textcolor: kButtonColor, weight: FontWeight.normal,),
                          NormalText(text: '66'+' kg\n', textcolor: kButtonColor, weight: FontWeight.normal,),
                          NormalText(text: '20'+'\n', textcolor: kButtonColor, weight: FontWeight.normal,),
                          NormalText(text: '1440'+'\n', textcolor: kButtonColor, weight: FontWeight.normal,),
                          NormalText(text: '25', textcolor: kButtonColor, weight: FontWeight.normal,),
                        ],),

                    )
                ],)),
                Padding(
                    padding: EdgeInsets.only(top: 25,bottom: 20),
                child: GestureDetector(
                  onTap: (){
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (v)=> DataHomeScreen())
                    );
                  },
                child: LeftIconWithText(
                    icon_name: Icons.edit_note_outlined,
                    text: 'Edit',
                    weight: FontWeight.bold
                ))
                ),
                GestureDetector(
                    onTap: (){} async{
                      await FirebaseAuth.instance.signOut();
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Login(),));
                    },
                    child: LeftIconWithText(
                    icon_name: Icons.logout_outlined,
                    text: 'Logout',
                    weight: FontWeight.bold
                ))
               ]))

 );
  }
}