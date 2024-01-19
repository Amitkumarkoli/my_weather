import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:my_weather/Screens/weather_info.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _ButtonState();
}

class _ButtonState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 132, 191, 240),
      appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back))),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.blueAccent,
        height: 60,
        items: <Widget>[
          Icon(Icons.home, size: 30),
          Icon(Icons.settings, size: 30),
          Icon(Icons.person, size: 30),
        ],
        onTap: (index) {
          //Handle button tap
        },
      ),
      body: SafeArea(
        child: Center(
          child: Align(
            alignment: Alignment.topCenter,
            child: Column(children: [
              Image(
                image: AssetImage(
                  'assets/images/forecast_image.png',
                ),
                width: screenSize.width * 0.8,
                height: screenSize.width * 0.8,
              ),
              SizedBox(height: screenSize.width * 0.25),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => WeatherInfo()));
                  },
                  child: Text('check Your Weather'),                 
                  ),
            ]),
          ),
        ),
      ),
    );
  }
}
