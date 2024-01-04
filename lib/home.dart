import 'package:flutter/material.dart';
import 'package:my_weather/Screens/show_weather.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _ButtonState();
}

class _ButtonState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 132, 191, 240),
        body: Container(
          child: Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ShowWeather()));
              },
              child: Text('check your weather'),
            ),
          ),
        ));
  }
}
