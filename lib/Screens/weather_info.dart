import 'dart:convert';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:my_weather/Models/weather_models.dart';
import 'package:http/http.dart' as http;

class WeatherInfo extends StatefulWidget {
  const WeatherInfo({super.key});

  @override
  State<WeatherInfo> createState() => _WeatherInfo();
}

class _WeatherInfo extends State<WeatherInfo> {
  late Future<WeatherModel> futureWeatherModel;

  @override
  void initState() {
    super.initState();
    futureWeatherModel = fetchWeatherModel();
  }

  Future<WeatherModel> fetchWeatherModel() async {
    final response = await http.get(Uri.parse(
        "https://api.openweathermap.org/data/2.5/weather?lat=30.28&lon=77.97&appid=a1f732178a56a64ee647d5d32a92a3c5"));

    if (response.statusCode == 200) {
      // Parse the JSON response
      return WeatherModel.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>);
    } else {
      throw Exception("Failed to load data");
    }
  }

  String getWeatherImage(String description) {
    // Map weather conditions to image assets
    switch (description.toLowerCase()) {
      case 'clear':
        return 'assets/images/clear.jpg';
      case 'clouds':
        return 'assets/images/cloudy.jpg';
      case 'rain':
        return 'assets/images/rainy.jpg';
      // Add more cases as needed
      default:
        return 'assets/images/default.jpg';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 176, 227, 233),
        elevation: 0,
        title: const Center(
          child: Text('The Weather App'),
        ),
      ),
      
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
     
      
      
      body: Center(
        child: FutureBuilder<WeatherModel>(
            future: futureWeatherModel,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              } else if (!snapshot.hasData) {
                return const Text('No data available.');
              }

              final weatherData = snapshot.data!;
              final weatherImage =
                  getWeatherImage(weatherData.weather[0].description);

              return Stack(
                  fit: StackFit.expand, 
                  children: [
                  Image.asset(
                  weatherImage,
                  width: 140,
                  height: 240,
                  fit: BoxFit.cover,
                ),
                const SizedBox(height: 30.0),
                Align(
                    alignment: Alignment.center,
                    child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Max Temperature: ${weatherData.main.tempMax}°C',
                              style: const TextStyle(fontSize: 18.0),
                            ),
                            const SizedBox(height: 16.0),
                            Text(
                              'Min Temperature: ${weatherData.main.tempMin}°C',
                              style: const TextStyle(fontSize: 18.0),
                            ),
                            const SizedBox(height: 16.0),
                            Text(
                              'Pressure: ${weatherData.main.pressure} hPa',
                              style: const TextStyle(fontSize: 18.0),
                            ),
                            const SizedBox(height: 16.0),
                            Text(
                              'Weather Description: ${weatherData.weather[0].description}',
                              style: const TextStyle(fontSize: 18.0),
                            ),
                            const SizedBox(height: 16.0),
                            Text(
                              'Country: ${weatherData.sys.country}DIA',
                              style: const TextStyle(fontSize: 18.0),
                            ),
                            const SizedBox(height: 16.0),
                            Text(
                              'name: ${weatherData.name}',
                              style: const TextStyle(fontSize: 18.0),
                            ),
                          ],
                        )))
              ]);
            }),
      ),
    );
  }
}
