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
      return '๐ฉ';
    } else if (condition < 400) {
      return '๐ง';
    } else if (condition < 600) {
      return 'โ๏ธ';
    } else if (condition < 700) {
      return 'โ๏ธ';
    } else if (condition < 800) {
      return '๐ซ';
    } else if (condition == 800) {
      return 'โ๏ธ';
    } else if (condition <= 804) {
      return 'โ๏ธ';
    } else {
      return '๐คทโ';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s ๐ฅต time ';
    } else if (temp > 20) {
      return 'Time for shorts and ๐';
    } else if (temp < 10) {
      return 'You\'ll need ๐งฃ and ๐งค';
    } else {
      return 'Bring a ๐งฅ just in case';
    }
  }
}
