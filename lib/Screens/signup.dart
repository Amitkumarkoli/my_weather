import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_weather/Screens/wrapper.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUp> {

  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  SignUp()async{
    await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email.text, password: password.text);
    Get.offAll(Wrapper());
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text('SignUP'),),
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
              onPressed: (()=>SignUp()), 
              style: ButtonStyle(
                  minimumSize: MaterialStateProperty.all(
                  Size(double.infinity, 50)),
                ),
              child: Text('SignUp'))
          ],
        ),
      ),
    );
  }
}
