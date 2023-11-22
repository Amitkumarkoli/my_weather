import 'package:flutter/material.dart';
import 'Screens/show_weather.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Weather App',
      debugShowCheckedModeBanner: false,
      home: WeatherApp(),
    );
  }
}

class WeatherApp extends StatefulWidget {
  const WeatherApp({super.key});

  @override
  State<WeatherApp> createState() => WeatherAppState();
}

class WeatherAppState extends State<WeatherApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/images/weatherimage2.jpeg',
            fit: BoxFit.cover, //  set image in entire screen
            width: double.infinity,
            height: double.infinity,
          ),
          const Padding(
            padding: EdgeInsets.only(top: 180.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Weather \nForecasts',
                      style: TextStyle(
                        fontSize: 60.0,
                        fontWeight: FontWeight.bold,
                      )
                    ),
                  SizedBox(height: 10.0),
                  Text(
                    'Has accourate weather information \nfor anytime and anywhere',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.normal,
                    )
                  )
                ],
              ),    
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 72.0),
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ShowWeather()));
                  },
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(300.0, 50.0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                    backgroundColor: const Color.fromARGB(255, 150, 116, 53),
                    elevation: 20,
                  ),
                  child: const Text(
                    'Get Started!',
                    
                    style: TextStyle(fontSize: 20.0,
                    color: Colors.white),
                    
                  )),
            ),
          ),
        ],
      ),
    );
  }
}