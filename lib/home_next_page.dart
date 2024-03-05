import 'package:flutter/material.dart';
import 'package:gradproj/LosingWeight.dart';
import 'package:gradproj/report.dart';
import 'package:gradproj/settings.dart';

import 'build_body.dart';
import 'homepage.dart';

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
      home: SportsScreen(),
    );
  }
}

class SportsScreen extends StatefulWidget {
  @override
  _SportsScreenState createState() => _SportsScreenState();
}

class _SportsScreenState extends State<SportsScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    HomeTab(),
    HomeTab(),
    HomeTab(),
    //ProgressTab(),
    //SettingsTab(),
  ];

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
          MaterialPageRoute(builder: (v)=> Report())
      );
    } else if(index == 2){
      Navigator.of(context).push(
          MaterialPageRoute(builder: (v)=> Settings())
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'What is your goal ?',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        elevation: 0, // Remove the bar under the title bar
      ),
      body: Column(
        children: [
          Container(
            height: 10,
           // color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(width: 8),
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
              Padding(
                  padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
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
                    ),
                  )),
              Padding(
                  padding: EdgeInsets.fromLTRB(110, 0, 20, 0),
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
                  padding: EdgeInsets.fromLTRB(90, 0, 0, 0),
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
    'images/man3.jpg',
    'images/dunble.jpg',
    //'assets/diner.jpg',
  ];

  final List<String> photoTexts = [
    'Build a fit body',
    'Losing Weight',
    //'Diner',
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: 16.0), // Adjusted padding here
      itemCount: 2, // Display only two photos
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
        MaterialPageRoute(builder: (v)=> Build())
        );
        }else if(index == 1){
        Navigator.of(context).push(
        MaterialPageRoute(builder: (v)=> LosingWeight1())
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
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
