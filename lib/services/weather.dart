import 'package:clima/services/location.dart';

import 'networking.dart';

const apikey = 'b43ecf98b7c6f53ea26400846fb6ccf7';
const openweatherURL = 'http://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future<dynamic> getcityWeather(String cityName) async {
    String url = '$openweatherURL?q=$cityName&appid=$apikey&units=metric';
    networkHelper networkhelper = networkHelper(url);

    var weatherData = await networkhelper.getData();
    return weatherData;
  }

  Future<dynamic> getweatherLocation() async {
    Location location = Location();
    await location.getcurrentlocation();
    networkHelper networkhelper = networkHelper(
        '$openweatherURL?lat=${location.latitude}&lon=${location.longitude}&appid=$apikey&units=metric');

    var weatherData = await networkhelper.getData();
    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🥵 time ';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
