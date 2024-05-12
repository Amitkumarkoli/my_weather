import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_weather/Screens/forgot_password.dart';
import 'package:my_weather/Screens/signup.dart';

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  SignIn()async{
    await FirebaseAuth.instance.signInWithEmailAndPassword(email: email.text, password: password.text);
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: Text('Login'),),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: email,
              decoration: InputDecoration(
                labelText: 'Enter Your Email',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: password,
              decoration: InputDecoration(
                labelText: 'Enter Your Password',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),   
            ElevatedButton(
              onPressed: (()=>SignIn()), 
              style: ButtonStyle(
                  minimumSize: MaterialStateProperty.all(
                  Size(double.infinity, 50)),
                ),
              child: Text('Login')),
            SizedBox(height: 20),   
            ElevatedButton(
              onPressed: (()=>Get.to(SignUp())), 
              style: ButtonStyle(
                  minimumSize: MaterialStateProperty.all(
                  Size(double.infinity, 50)),
                ),
              child: Text('SignUp')),
              SizedBox(height: 20),   
            ElevatedButton(
              onPressed: (()=>Get.to(ForgotPassword())), 
              style: ButtonStyle(
                  minimumSize: MaterialStateProperty.all(
                  Size(double.infinity, 50)),
                ),
              child: Text('forgot password'))
          ],
        ),
      ),
    );
  }
}