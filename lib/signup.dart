//import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gradproj/home_screen.dart';
import 'package:gradproj/screens/home.dart';
import 'package:gradproj/welcome.dart';

//import 'home_screen.dart';



class SignUp extends StatefulWidget{
  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController fullname= TextEditingController();
  TextEditingController emailController= TextEditingController();
  TextEditingController passwordController= TextEditingController();
  TextEditingController conf_Password= TextEditingController();
  String? email;
  String? password;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Health Pulse',
      home: Scaffold(
        body: _page(),
      ),

    );


  }

  Widget _page() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(32.0, 100.0, 32.0, 0),
      child: Center(
        child: Column(
          children: [

            _extraText(),
            const SizedBox(height: 50),

            _inputField("Enter your full name", fullname),
            const SizedBox(height: 20),
            _inputField("Enter your email",emailController/*,onChanged: (data){emailController.text =data;}*/),
            const SizedBox(height: 20),
            _inputField("Create your password", passwordController,isPassword: true/*,onChanged: (data){passwordController.text=data;}*/),
            const SizedBox(height: 20),
            _inputField("Confirm your password", conf_Password,isPassword: true),
            const SizedBox(height: 50),
            _loginBtn(),

          ],
        ),
      ),
    );
  }
  Widget _inputField(String hintText,TextEditingController controller, {isPassword =false/*, onChanged*/}){
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
       /* await registerUser(
        email: emailController.text,
        password: passwordController.text,
        );*/
        Navigator.of(context).push(
            MaterialPageRoute(builder: (v)=> DataHomeScreen())
        );
      },
      child: const SizedBox(
          width: 100,
          child: Text(
            "Sign Up",
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
      "Create Your Account",
      textAlign: TextAlign.left,
      style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          //color: Color.fromRGBO(110, 108, 108, 1.0)
      ),



    );
  }
  /*Future<void> registerUser({required String email, required String password}) async {
    try {
      UserCredential user = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      Navigator.push(context, MaterialPageRoute(builder: (context) => Welcome()));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('This email is already in use')));
      } else if (e.code == 'weak-password') {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Weak Password')));
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Something went wrong')));
    }
  }*/
}