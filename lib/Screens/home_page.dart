import 'package:carousel_slider/carousel_slider.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_weather/Screens/profile.dart';
import 'package:my_weather/Screens/settings.dart';
import 'package:my_weather/Screens/weather_info.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _ButtonState();
}

class _ButtonState extends State<HomePage> {
  int activeIndex = 0;
  final controller = CarouselController();
  final user = FirebaseAuth.instance.currentUser;

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
          height: 60,
          items: <Widget>[
            Icon(Icons.settings, size: 30),
            Icon(Icons.home, size: 30),
            Icon(Icons.person, size: 30),
          ],
          onTap: (index) {
            if (index == 0) {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Settings()));
            }
            ;
            if (index == 2) {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => UserProfile()));
            }
          },
        ),
        body: SafeArea(
          child: Center(
            child: Align(
              alignment: Alignment.topCenter,
              child: Column(children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.10,
                ),
                Text('${user!.email}'),
                Container(
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: Center(
                    child: Column(
                      children: [
                        CarouselSlider(
                          items: [
                            // Adding image widgets
                            Image.asset(
                              'assets/images/forecast_image.png',
                              width: double.infinity,
                              height: 250,
                              fit: BoxFit.cover,
                            ),
                            Image.asset(
                              'assets/images/cold_air.png',
                              width: double.infinity,
                              height: 250,
                              fit: BoxFit.cover,
                            ),
                            Image.asset(
                              'assets/images/hot_weather.png',
                              width: double.infinity,
                              height: 250,
                              fit: BoxFit.cover,
                            ),
                            Image.asset(
                              'assets/images/rain_image.png',
                              width: double.infinity,
                              height: 250,
                              fit: BoxFit.cover,
                            ),
                            Image.asset(
                              'assets/images/rain.png',
                              width: double.infinity,
                              height: 250,
                              fit: BoxFit.cover,
                            ),
                          ],
                          options: CarouselOptions(
                            height: 200.0,
                            autoPlay: true,
                            autoPlayCurve: Curves.fastOutSlowIn,
                            enableInfiniteScroll: true,
                            autoPlayAnimationDuration:
                                Duration(milliseconds: 800),
                            viewportFraction: 0.8,
                            onPageChanged: (index, reason) =>
                                setState(() => activeIndex = index),
                          ),
                          carouselController: controller,
                        ),
                        SizedBox(height: 20),
                        AnimatedSmoothIndicator(
                          activeIndex: activeIndex,
                          count: 5,
                          axisDirection: Axis.horizontal,
                          effect: JumpingDotEffect(
                            dotWidth: 18,
                            dotHeight: 18,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(height: screenSize.width * 0.20),
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
        ));
  }
}
