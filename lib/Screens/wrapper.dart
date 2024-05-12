import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_weather/Screens/home_page.dart';
import 'package:my_weather/Screens/login.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({super.key});

  @override
  State<Wrapper> createState() => _loginState();
}

class _loginState extends State<Wrapper> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(), 
        builder: (context,snapshot){
          if (snapshot.hasData) {
            return HomePage();
          } else {
            return login();
          }
        }),
    );
  }
}