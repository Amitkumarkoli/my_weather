import 'package:flutter/material.dart';
import 'package:my_weather/Screens/signup.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Color.fromRGBO(132, 191, 240, 1),
      body: Stack(
        children: [
          Column(
            children: [
              Center(
                child: Container(
                  margin: EdgeInsets.only(top: 70),
                  child: Image.asset(
                    'assets/images/logo.png',
                    width: 250,
                    height: 250,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 50),
          const Padding(
            padding: EdgeInsets.only(top: 180.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(' Weather \nForecasts',
                      style: TextStyle(
                        fontSize: 62.0,
                        fontWeight: FontWeight.bold,
                      )),
                  SizedBox(height: 10.0),
                  Text(
                      'Has accurate weather information \n       for anytime and anywhere',
                      style: TextStyle(
                        fontSize: 22.0,
                        fontWeight: FontWeight.normal,
                      ))
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
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SignUp()));
                },
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(300.0, 50.0),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  backgroundColor: const Color.fromARGB(255, 150, 116, 53),
                  elevation: 20,
                ),
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 50),
                      child: Text(
                        'Get Started',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: screenSize.width * 0.06,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(width: 30.0),
                    Icon(
                      Icons.arrow_forward,
                      size: screenSize.width * 0.10,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
