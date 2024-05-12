import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_weather/Screens/wrapper.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Platform.isAndroid
  ? await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "AIzaSyBt8zt6_DkFQMecXsuUgzVGdzH1JaFA5zI", 
        appId: "1:619873837181:android:076ce64ab30357bf785114", 
        messagingSenderId: "619873837181", 
        projectId: "my-weather-f45e4"
      ))
    : await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Weather App',
      debugShowCheckedModeBanner: false,
      home: Wrapper(),
    );
  }
}