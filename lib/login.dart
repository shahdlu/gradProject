//import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gradproj/home_screen.dart';
import 'package:gradproj/homepage.dart';
import 'package:gradproj/screens/home.dart';
import 'package:gradproj/signup.dart';
//import 'package:gradproj/welcome.dart';

//import 'home_screen.dart';



class Login extends StatefulWidget{
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailController= TextEditingController();
  TextEditingController passwordController= TextEditingController();


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Health Pulse',

        home: Scaffold(
          body: Container(
            width: double.infinity,
            height: double.infinity,
       /*     decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("images/logback13.png"),
                  fit: BoxFit.cover
              ),
            ),
*/
            child: _page(),
          ),
        ));

  }

  Widget _page() {
  return Padding(
    padding: const EdgeInsets.fromLTRB(32.0, 100.0, 32.0, 0),
    child: Center(
      child: Column(
        children: [
          _title(),
          const SizedBox(height: 50),
          _inputField("Enter your Email", emailController/*,onChanged: (data){emailController.text =data;}*/),
          const SizedBox(height: 20),
          _inputField("Enter your Password", passwordController,isPassword: true/*,onChanged:(data){passwordController.text =data;}*/),
          const SizedBox(height: 50),
          _loginBtn(),

          Row(
            children: [
              const SizedBox(height: 80),
              _extraText(),
              const SizedBox(height: 30),
              _extraText2(),
            ],
          )
        ],
      ),



    ),
  );
   Container(

  );
}
Widget _inputField(String hintText,TextEditingController controller, { /*onChanged,*/isPassword =false}){
 // Function(String)? onChanged;
 var border = OutlineInputBorder(
    borderRadius: BorderRadius.circular(15),
    borderSide: const BorderSide(color: Color.fromRGBO(236, 234, 234, 1.0))
  );
  return TextField(
   // onChanged: onChanged,
    style: const TextStyle(color: Color.fromRGBO(8, 97, 231, 1.0)),
    controller: controller,
    decoration: InputDecoration(
      hintText: hintText,
      hintStyle: const TextStyle(color: Color.fromRGBO(145, 143, 143, 1.0)),
      filled: true,
      fillColor: Color.fromRGBO(236, 234, 234, 1.0),
     enabledBorder: border,
      focusedBorder: border,

    ),
    obscureText: isPassword,
  );
}
Widget _loginBtn(){
    return ElevatedButton(
        onPressed: ()/*async*/{
         // await loginUser(email: emailController.text!, password: passwordController.text!);
          Navigator.of(context).push(
              MaterialPageRoute(builder: (v)=> HomePageScreen())
          );
        },
        child: const SizedBox(
            width: 100,
            child: Text(
              "Login",
              textAlign: TextAlign.center,


              style: TextStyle(fontSize: 20),
            )),
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),

          primary: Color.fromRGBO(8, 97, 231, 1.0),
          onPrimary: Colors.white,
         // padding: const EdgeInsets().symmetric(vertical: 16),
        ),

    );
}
Widget _extraText(){
    return const Text(
      "Don't have an account?",
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 16,
        color: Color.fromRGBO(110, 108, 108, 1.0)
      ),



    );
}
  Widget _extraText2(){
    return Container(
      child: TextButton(
        onPressed: (){        Navigator.of(context).push(
            MaterialPageRoute(builder: (v)=> SignUp())
        );
          },
        child: Text(
          "  Sign Up",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 16,
              color: Color.fromRGBO(8, 97, 231, 1.0)
          ),



        ),

      ),

    );
  }
  Widget _title(){
    return const Text(
      "Login To Your Account",
      textAlign: TextAlign.left,
      style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          //color: Color.fromRGBO(110, 108, 108, 1.0)
      ),



    );
  }
  /*Future<void> loginUser({required String email, required String password}) async {
    try {
      UserCredential user = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      Navigator.push(context, MaterialPageRoute(builder: (context) => Welcome()));
      // Handle successful login here
    } on FirebaseAuthException catch (e) {
      String errorMessage = 'please enter correct email and password!';

      if (e.code == 'user-not-found') {
        errorMessage = 'User not found';
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(errorMessage)));
      } else if (e.code == 'wrong-password') {
        errorMessage = 'Wrong password';
      }
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(errorMessage)));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('please enter correct email and password!')));
    }
  }*/
}