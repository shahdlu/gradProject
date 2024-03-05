import 'package:flutter/material.dart';
import 'package:gradproj/login.dart';
import 'package:gradproj/rest1.dart';
import 'package:gradproj/secondwel.dart';
import 'package:gradproj/settings.dart';



class Welcome extends StatefulWidget{
  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Health Pulse',
      home: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/welcomeback5.png"),
              fit: BoxFit.cover
            ),
          ),

        child: _page(),
      ),
    ));

  }

  Widget _page() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(250,700,0,0),
      child: Center(
        child: Column(
          children: [
            const SizedBox(height: 50),
            _loginBtn(),

          ],
        ),
      ),
    );
  }
  Widget _loginBtn(){
    return TextButton(
      onPressed: (){
        Navigator.of(context).push(
          MaterialPageRoute(builder: (v)=> SecondWelcome())
        );

      },
      child: Image(
        image: AssetImage('images/arrow3.png'),


          ),

    );
  }
}