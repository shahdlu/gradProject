import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gradproj/reports.dart';
import 'package:gradproj/screens/home.dart';

import 'homepage.dart';



class Settings extends StatefulWidget{
  @override
  State<Settings> createState() => _SettingsState();
}
class _SettingsState extends State<Settings> {


    final items=['30','40','50','60'];
    int index=0;
    int _currentIndex = 0;

    void _onTabTapped(int index) {
      setState(() {
        _currentIndex = index;

      });
      if(index == 0){
        Navigator.of(context).push(
            MaterialPageRoute(builder: (v)=> HomePageScreen())
        );
      }  else if(index == 1){
        Navigator.of(context).push(
            MaterialPageRoute(builder: (v)=> Reports())
        );
      } else if(index == 2){
        Navigator.of(context).push(
            MaterialPageRoute(builder: (v)=> Settings())
        );
      }
    }

  @override
  Widget build(BuildContext context) {
  return  MaterialApp(
      title: 'Health Pulse',

      home: Scaffold(
        appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Padding( padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
                child: Text(
                  'Settings',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ))),
        body: Column(
          children: [
            Divider(
            thickness: 2.7,
              indent: 45,
              endIndent: 90,
              color: Color.fromRGBO(8, 97, 231, 1.0),


            ),
        Padding(
            padding: EdgeInsets.fromLTRB(30, 30, 0, 30),
          child: Row(
            children: [

              Icon(
                  Icons.account_circle_outlined,
                size: 35,
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(8, 0, 0, 0),
              child: Text(
                "Profile",
              style: TextStyle(fontWeight: FontWeight.bold,
              fontSize: 25,),),
        )
              ],)
          ),
            Row(
              children: [
                Padding(padding: EdgeInsets.fromLTRB(30, 0, 0, 0)),
                Text("Gender",
                  style: TextStyle(fontWeight: FontWeight.bold,
                      fontSize: 20,color: Color.fromRGBO(8, 97, 231, 1.0)),),
                Padding(padding: EdgeInsets.fromLTRB(150, 0, 0, 0)),
                Text("Male",
                  style: TextStyle(fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Color.fromRGBO(8, 97, 231, 1.0)),),
              ],
            ),
            Row(
              children: [
                Padding(padding: EdgeInsets.fromLTRB(30, 70, 0, 0)),
                Text("Height",
                  style: TextStyle(fontWeight: FontWeight.bold,
                      fontSize: 20,color: Color.fromRGBO(8, 97, 231, 1.0)),),
                Padding(padding: EdgeInsets.fromLTRB(150, 70, 0, 0)),
                Text("177 cm",
                  style: TextStyle(fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Color.fromRGBO(8, 97, 231, 1.0)),),
              ],
            ),
            Row(
              children: [
                Padding(padding: EdgeInsets.fromLTRB(30, 70, 0, 0)),
                Text("Weight",
                  style: TextStyle(fontWeight: FontWeight.bold,
                      fontSize: 20,color: Color.fromRGBO(8, 97, 231, 1.0)),),
                Padding(padding: EdgeInsets.fromLTRB(150, 70, 0, 0)),
                Text("66 kg",
                  style: TextStyle(fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Color.fromRGBO(8, 97, 231, 1.0)),),
              ],
            ),
            Row(
              children: [
                Padding(padding: EdgeInsets.fromLTRB(30, 70, 0, 0)),
                Text("Training Rest",
                  style: TextStyle(fontWeight: FontWeight.bold,
                      fontSize: 20,color: Color.fromRGBO(8, 97, 231, 1.0)),),
                Padding(padding: EdgeInsets.fromLTRB(60, 70, 0, 0)),
                CupertinoButton(
                    child: Row(children: [
                      Text(items[index] +'Secs',
                        style: TextStyle(fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Color.fromRGBO(8, 97, 231, 1.0)),),
                      Padding(padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                      child: Image.asset('images/triangle.png'),),
                    ],),

                    onPressed: () => showDialog(
                        context: context,
                        builder: (_) => AlertDialog(
                          backgroundColor: Colors.white,
                          title: Text("Training Rest",
                              style: TextStyle(
                                fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                color: Colors.black),
                           ),
                       content: _buildPicker(),
                       actions: <Widget>[
                        TextButton(
                           onPressed: ()=> Navigator.pop(context),
                           child: Text('Cancle',
                               style: TextStyle(
                               fontSize: 15,
                                   color: CupertinoColors.secondaryLabel
                               ),)),
                         TextButton(
                             onPressed: ()=> Navigator.pop(context),
                             child: Text('Save',
                               style: TextStyle(
                               fontSize: 15,
                                   color: Color.fromRGBO(8, 97, 231, 1.0),
                               ),)),],


                  ),
                    )),
                //Image.asset('images/triangle.png'),

              ],
            ),
            GestureDetector(
              onTap: (){
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (v)=> DataHomeScreen())
                );
              },
            child: Padding(
                padding: EdgeInsets.fromLTRB(30, 30, 0, 0),
            child: Row(
              children: [

              Icon(
                Icons.edit_note_outlined,
                size: 45,
                //weight: 20,
              ),
              Padding(
                  padding: EdgeInsets.fromLTRB(8, 0, 0, 0),
              child: Text("Edit",
                style: TextStyle(fontWeight: FontWeight.bold,
                    fontSize: 25),)
              ),
            ],)),),
          GestureDetector(
              onTap: (){

              },
              child: Padding(
                padding: EdgeInsets.fromLTRB(30, 20, 0, 0),
              child: Row(
                children: [
              Icon(
                Icons.logout_outlined,
                size: 35,
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(18, 0, 0, 0),
              child: Text("Logout",
                style: TextStyle(fontWeight: FontWeight.bold,
                    fontSize: 25),),
              )

            ],),
          ),
        ),
            ],
      ),

        bottomNavigationBar: Container(
          height: 56,
          padding: EdgeInsets.fromLTRB(10, 10, 30, 0),
          color: Colors.white,
          child: Row(
            children: [
                          Padding(
                          padding: EdgeInsets.fromLTRB(30, 0, 15, 0),
                          child: GestureDetector(
                              onTap: (){
                                Navigator.of(context).push(
                                    MaterialPageRoute(builder: (v)=> HomePageScreen())
                                );
                              },
                          child: Icon(
                            Icons.home,
                            size: 30,
                            color: Color.fromRGBO(145, 143, 143, 1.0),

                          ))
                          ),
                     GestureDetector(
                         onTap: (){
                           Navigator.of(context).push(
                               MaterialPageRoute(builder: (v)=> Reports())
                           );
                         },
              child: Padding(
                padding: EdgeInsets.fromLTRB(65, 0, 20, 0),
                child: Icon(
                  Icons.timeline,
                  size: 27,
                  color: Color.fromRGBO(145, 143, 143, 1.0),
                ),
              )
               ),
              Padding(
                padding: EdgeInsets.fromLTRB(35,0,0,0),
              child: GestureDetector(
                  onTap: (){
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (v)=> Settings())
                    );
                  },
                  child: Container(
                      padding: EdgeInsets.fromLTRB(0,0,15,0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(25)),
                        color: Color.fromRGBO(8, 97, 231, 0.14901960784313725),
                      ),
                      //color: Color.fromRGBO(8, 97, 231, 0.14901960784313725),
                      child: Row(
                        children: [
                          IconButton(
                              onPressed: (){}
                              , icon: Icon(
                            Icons.settings,
                            size: 27,
                            color: Color.fromRGBO(8, 97, 231, 1.0),
                          )
                          ),
                          Text(
                            'Settings',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color.fromRGBO(8, 97, 231, 1.0)
                            ),
                          ),
                        ],
                      )))),
            ],
          ),
        )));



}
    Widget _buildPicker() =>  SizedBox(
        width: 150,
        height: 150,
      child: CupertinoPicker(
        selectionOverlay: CupertinoPickerDefaultSelectionOverlay(
        background: CupertinoColors.activeBlue.withOpacity(0.2)),
        itemExtent: 40,


        scrollController: FixedExtentScrollController(
          initialItem: 30,
        ),
        children:  items
            .map((item) => Center(
          child: Text(
            item,
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Color.fromRGBO(8, 97, 231, 1.0),
            ),
          ),

        )).toList(),

        onSelectedItemChanged: (index){

          setState(() {
            this.index=index;
          });
        },
      ),
    );
   }