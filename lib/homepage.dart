import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:gradproj/home_next_page.dart';
import 'package:gradproj/medicine.dart';
import 'package:gradproj/report.dart';
import 'package:gradproj/settings.dart';

import 'food.dart';

void main() {
  runApp(NavigationBarApp());
}

class NavigationBarApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Health Pulse',

      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePageScreen(),
    );
  }
}

class HomePageScreen extends StatefulWidget {
  @override
  _HomePageScreenState createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  int _currentIndex = 0;
  late DateTime _selectedDate;

  final List<Widget> _screens = [
    HomeTab(),
    HomeTab(),
    HomeTab(),
    //ProgressTab(),
   // SettingsTab(),
  ];

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;

    });

  }

  void _selectDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: Color.fromRGBO(8, 97, 231, 1.0),
            hintColor: Color.fromRGBO(8, 97, 231, 1.0),
            colorScheme: ColorScheme.light(primary: Color.fromRGBO(8, 97, 231, 1.0)),
            buttonTheme: ButtonThemeData(
              textTheme: ButtonTextTheme.primary,
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  @override
  void initState() {
    _selectedDate = DateTime.now();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         automaticallyImplyLeading: false,
        title: Padding(padding: EdgeInsets.fromLTRB(30, 0, 0, 0),

        child: Row(
          children: [
            Text(
              'Health pulse',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(width: 8),
            IconButton(
              icon: Icon(
                Icons.notifications,
                color: Color.fromRGBO(8, 97, 231, 1.0),
              ),
              onPressed: () {
                // Handle notification button press
              },
            ),
          ],
        )),
      ),
      body: Column(
        children: [
          Container(
            height: 60,
           // color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Currently Date: ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(8, 97, 231, 1.0), // Set the color to blue
                  ),
                ),
                SizedBox(width: 8),
                InkWell(
                  onTap: _selectDate,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                     // color: Colors.white,
                    ),
                    child: Text(
                      _selectedDate != null
                          ? _selectedDate.toLocal().toString().split(' ')[0]
                          : 'Pick Date',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: _screens[_currentIndex],
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: 56,
        padding: EdgeInsets.fromLTRB(30, 10, 30, 0),
        color: Colors.white,
     child: Row(
       children: [
         GestureDetector(
             onTap: (){
               Navigator.of(context).push(
                   MaterialPageRoute(builder: (v)=> HomePageScreen())
               );
             },
           child: Container(
               padding: EdgeInsets.fromLTRB(0,0,15,0),
             decoration: BoxDecoration(
               borderRadius: BorderRadius.all(Radius.circular(25)),
               color: Color.fromRGBO(8, 97, 231, 0.14901960784313725),
             ),
           child: Row(
             children: [
              IconButton(
               onPressed: (){}
             , icon: Icon(
                  Icons.home,
                size: 30,
                color: Color.fromRGBO(8, 97, 231, 1.0),
              )
              ),
               Text(
                 'Home',
               style: TextStyle(
                 fontWeight: FontWeight.bold,
                 color: Color.fromRGBO(8, 97, 231, 1.0)
               ),
             ),
             ],
         ))),
         Padding(
         padding: EdgeInsets.fromLTRB(47, 0, 20, 0),
         child: GestureDetector(
           onTap: (){
             Navigator.of(context).push(
                 MaterialPageRoute(builder: (v)=> Report())
             );
           },
         child: Icon(

               Icons.timeline,
               size: 27,
               color: Color.fromRGBO(145, 143, 143, 1.0),
             ),
         )),
         Padding(
           padding: EdgeInsets.fromLTRB(80, 0, 0, 0),
         child: GestureDetector(
           onTap: (){
                    Navigator.of(context).push(
                    MaterialPageRoute(builder: (v)=> Settings())
            );
            },
         child: Icon(

             Icons.settings,
             size: 27,
             color: Color.fromRGBO(145, 143, 143, 1.0),
           ),
         )),
       ],
     ),
      )


    );
  }
}

class HomeTab extends StatelessWidget {
  final List<String> photoPaths = [
    'images/mfitness1.jpg',
    'images/food2.jpg',
    'images/medicine.jpg',
  ];

  final List<String> photoTexts = [
    'Sport',
    'Food',
    'Medicine',
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: 16.0), // Adjusted padding here
      itemCount: photoPaths.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Stack(
            alignment: Alignment.center,
            children: [
              GestureDetector(
                onTap: (){
                  if(index == 0){
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (v)=> SportsScreen())
                  );
                }else if(index == 1){
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (v)=> FoodScreen())
                    );
                  }else if(index == 2){
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (v)=> Medicine())
                    );
                  }
                },
             child: Container(

                width: MediaQuery.of(context).size.width - 32, // Adjusted width here
                height: MediaQuery.of(context).size.height / 4.3,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: Colors.white,
                    width: 2,
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    photoPaths[index],
                    fit: BoxFit.cover,
                  ),
                ),
              )),
              Positioned(
                left: 10,
                top: 10,
                child: Container(
                  padding: EdgeInsets.all(6),
                  // color: Colors.black54,
                  child: Text(
                    photoTexts[index],
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ) ,
            ],
          ),
        );
      },
    );
  }
}


