import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gradproj/screens/welcome&login/signup.dart';
import 'package:gradproj/theme/constants.dart';
import 'package:gradproj/widgets/button.dart';
import 'package:gradproj/widgets/custom_textfield.dart';

import '../../widgets/text.dart';


class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Health Pulse',
        home: Scaffold(
          body:  _page(),
          ),
        );
  }

  Widget _page() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(32.0, 100.0, 32.0, 0),
      child: Center(
        child: Column(
          children: [
           Row(
             children: [
            TextTitle(
              text: 'Login To Your\nAccount',
              textcolor: Colors.black,
            )]),
             Row(
               children: [
                 CustomTextField(
                     hintText: "Enter your email",
                     controller: emailController,
                     isPassword: false,
                     padding_left: 0,
                     padding_top: 50,
                     padding_right: 0,
                     padding_bottom: 0
                 )]),
                 Row(
                   children: [
                 CustomTextField(
                     hintText: "Enter your password",
                     controller: passwordController,
                     isPassword: true,
                     padding_left: 0,
                     padding_top: 30,
                     padding_right: 0,
                     padding_bottom: 0
                 ),
               ],),
            Padding(
              padding: EdgeInsets.only(top: 70,bottom: 30),
              child: CalculateButton(
                  title: 'Login',
                  onTap: async {
                    await loginUser(
                        email: emailController.text!, password: passwordController.text!);
                  },
                  buttonbackcolor: kButtonColor,
                  buttontextcolor: Colors.white
              ),
            ),
            Row(
              children: [
                SmallText(
                    text: "Don't have an account?",
                    textcolor: Colors.black,
                    weight: FontWeight.normal
                ),
                Padding(
                    padding: EdgeInsets.only(left: 15),
                  child: GestureDetector(
                    onTap: (){
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (v)=> SignUp())
                      );
                    },
                  child: SmallText(
                    text: 'Sign Up',
                    textcolor: kButtonColor,
                    weight: FontWeight.bold,
                  )),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
  Future<void> loginUser(
      {required String email, required String password}) async {
    try {
      UserCredential user = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => MainPage()));
      // Handle successful login here
    } on FirebaseAuthException catch (e) {
      String errorMessage = 'please enter correct email and password!';

      if (e.code == 'user-not-found') {
        errorMessage = 'User not found';
        // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(errorMessage)));
      } else if (e.code == 'wrong-password') {
        errorMessage = 'Wrong password';
      }
      // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(errorMessage)));
    } catch (e) {
      // ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('please enter correct email and password!')));
    }
  }
}