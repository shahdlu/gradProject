import 'package:flutter/material.dart';
import 'package:gradproj/screens/main_screens/settings.dart';
import 'package:gradproj/screens/reports/reports.dart';
import 'package:gradproj/widgets/navigation_bar.dart';
import 'package:intl/intl.dart';

import 'homepage.dart';

 class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
  }

   class _MainPageState extends State<MainPage> {
   Widget _homeWidget = HomePageScreen();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _homeWidget,
        bottomNavigationBar: NavigationBarGNav(
          showhomewidget: () {
            setState(() {
              _homeWidget = HomePageScreen();
            });
          },
          showreportwidget: () {
            setState(() {
              _homeWidget = Reports();
            });
          },
          showsettingswidget: () {
            setState(() {
              _homeWidget = Settings();
            });
          },
        ));
  }
}
