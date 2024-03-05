import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'login.dart';

class ThirdWelcome extends StatefulWidget{
  @override
  State<ThirdWelcome> createState() => _ThirdWelcomeState();
}

class _ThirdWelcomeState extends  State<ThirdWelcome> {


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
                  "images/wel3rd.png",
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
                              MaterialPageRoute(builder: (v)=> Login())
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
                          "Next ",
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