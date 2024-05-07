import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gradproj/theme/constants.dart';
import 'package:gradproj/widgets/button.dart';
import '../../widgets/custom_textfield.dart';
import '../../widgets/text.dart';
import '../data&bmr&bmi/datascreen.dart';



class SignUp extends StatefulWidget{
  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController fullname = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController conf_Password = TextEditingController();
  String? email;
  String? password;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Health Pulse',
      home: Scaffold(
        body: _page(),
      ),

    );
  }

  Widget _page() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(32.0, 100.0, 32.0, 0),
      child:  SingleChildScrollView(
          child: Column(
            children: [
              Row(
                  children: [
                    TextTitle(
                      text: 'Create Your\nAccount',
                      textcolor: Colors.black,
                    )]),
              Row(
                  children: [
                    CustomTextField(
                        hintText: "Enter your full name",
                        controller: fullname,
                        isPassword: false,
                        padding_left: 0,
                        padding_top: 50,
                        padding_right: 0,
                        padding_bottom: 0
                    )]),
              Row(
                children: [
                  CustomTextField(
                      hintText: "Enter your email",
                      controller: emailController,
                      isPassword: false,
                      padding_left: 0,
                      padding_top: 30,
                      padding_right: 0,
                      padding_bottom: 0
                  ),
                ],),
              Row(
                  children: [
                    CustomTextField(
                        hintText: "Create your password",
                        controller: passwordController,
                        isPassword: true,
                        padding_left: 0,
                        padding_top: 30,
                        padding_right: 0,
                        padding_bottom: 0
                    )]),
              Row(
                children: [
                  CustomTextField(
                      hintText: "Confirm your password",
                      controller: conf_Password,
                      isPassword: true,
                      padding_left: 0,
                      padding_top: 30,
                      padding_right: 0,
                      padding_bottom: 0
                  ),
                ],),
              Padding(
                  padding: EdgeInsets.only(top: 50),
                  child: CalculateButton(
                  title: 'Sign Up',
                  onTap: () {
              //     async {
              // await registerUser(
              // email: emailController.text,
              // password: passwordController.text,
              // );
              Navigator.of(context).push(
              MaterialPageRoute(builder: (v) => const DataHomeScreen())
              );
              },
                  buttonbackcolor: kButtonColor,
                  buttontextcolor: Colors.white
              ))

            ],
          ),
        ),

    );
  }
//   Future<void> registerUser({required String email, required String password}) async {
//     try {
//       UserCredential user = await FirebaseAuth.instance
//           .createUserWithEmailAndPassword(email: email, password: password);
//
//       Navigator.push(context, MaterialPageRoute(builder: (context) => DataHomeScreen()));
//     } on FirebaseAuthException catch (e) {
//       if (e.code == 'email-already-in-use') {
//         ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('This email is already in use')));
//       } else if (e.code == 'weak-password') {
//         ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Weak Password')));
//       }
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Something went wrong')));
//     }
//   }
//
}