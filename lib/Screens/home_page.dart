import 'package:flutter/material.dart';
import 'package:my_weather/Screens/show_weather.dart';

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
      body: SafeArea(
        child: Center(
          child: Align(
            alignment: Alignment.topCenter,
            child: Column(children: [
              Image(
                image: AssetImage(
                  'assets/images/forecast_image.png',
                ),
                width: screenSize.width*0.8,
                height: screenSize.width*0.8,
              ),
              SizedBox(height: screenSize.width*0.09),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ShowWeather()));
                  },
                  child: Text('check Your Weather')),
            ]),
          ),
        ),
      ),
    );
  }
}
