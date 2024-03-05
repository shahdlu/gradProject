import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gradproj/thirdwelcome.dart';

import 'login.dart';

class SecondWelcome extends StatefulWidget{
  @override
  State<SecondWelcome> createState() => _SecondWelcomeState();
}

class _SecondWelcomeState extends  State<SecondWelcome> {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Health Pulse',

      home: Scaffold(
        body: PageView(children: [
          Stack(
            children: [
              Container(
                width: double.infinity,
                child: Image.asset(
                  "images/get.png",
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                width: double.infinity,
                height: double.infinity,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(
                              MaterialPageRoute(builder: (v)=> ThirdWelcome())
                          );
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                            Color(0xFF0861E7),
                          ),
                          padding: MaterialStateProperty.all(
                              EdgeInsets.symmetric(
                                  horizontal: 79, vertical: 10)),
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15))),
                        ),
                        child: Text(
                          "Get Started ",
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ),
                      SizedBox(
                        height:  83.73,
                      ),
                    ]),
              ),
            ],
          )
        ]),
      ),
    );
  }
}