import 'package:flutter/material.dart';
import 'package:gradproj/report.dart';
import 'package:gradproj/settings.dart';

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
      home: DinnerScreen(),
    );
  }
}

class DinnerScreen extends StatefulWidget {
  @override
  _DinnerScreenState createState() => _DinnerScreenState();
}

class _DinnerScreenState extends State<DinnerScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    HomeTab(),
    HomeTab(),
    HomeTab(),
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
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Navigate back to the previous screen
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          'Dinner',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        elevation: 0, // Remove the bar under the title bar
      ),
      body: Column(
        children: [

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
  final List<String> textAreas = [
    'Pizza\n2 slices of pizza with\nvegetables salad .\n\nCalories                                 600cal',
    'Yogurt and Fruits\nmix natural yagurt,seasonal fruits,\nor : oatmeal, honey,\nor : molasses.\n\nCalories                                 500cal',
    //'Legume Soup and Salad\nlentil or peas or beans\nor any legume soup\nwith vegetables salad.\n\nCalories                                   400cal',
  ];

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        itemCount: textAreas.length,
        itemBuilder: (context, index) {
          // Split the text into title and paragraph
          List<String> parts = textAreas[index].split('\n');
          String title = parts[0];
          String paragraph = parts.sublist(1).join('\n');

          // Split the paragraph into segments
          List<String> segments = paragraph.split('Calories');

          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Container(
              width: MediaQuery.of(context).size.width - 32,
              height: MediaQuery.of(context).size.height / 4,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: Colors.grey.shade300,
                  width: 2,
                ),
                color: Colors.grey.shade300,
              ),
              child: Stack(
                alignment: Alignment.topLeft,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RichText(
                      text: TextSpan(
                        style: TextStyle(
                          fontSize: 22,
                        ),
                        children: [
                          TextSpan(
                            text: title + '\n',
                            style: TextStyle(
                              color: Colors.black87,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          // Apply blue color to the first part
                          TextSpan(
                            text: segments[0],
                            style: TextStyle(
                              color: Colors.grey.shade700,
                            ),
                          ),
                          // Apply black color to the 'Calories' and calorie values
                          TextSpan(
                            text: 'Calories',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text: segments[1].substring(0, 8), // '                                 '
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                          TextSpan(
                            text: segments[1].substring(8), // '250cal'
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: 1,
                    right: 40,
                    child: Checkbox(
                      value: false,
                      onChanged: (newValue) {
                        // Handle checkbox state changes
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

