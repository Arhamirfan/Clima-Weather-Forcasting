

# Clima ☁

## Our Goal

The objective of this tutorial is to learn about asynchronous programming in Dart. We'll look at how to carry out time consuming tasks such as getting device location and networking to get data from the internet. 


## Learning

- How to use Dart to perform asynchronous tasks.
- Understand async and await.
- Learn about Futures and how to work with them.
- How to network with the Dart http package.
- What APIs are and how to use them to get data from the internet.
- What JSONs are and how to parse them using the Dart convert package.
- How to pass data forwards and backwards between screens using the Navigator.
- How to handle exceptions in Dart using try/catch/throw.
- Learn about the lifecycle of Stateful Widgets and how to override them.
- How to use the Geolocator package to get live location data for both iOS and Android.
- How to use the TextField Widget to take user input.


## How to use API

-Get location:

- Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
- var latitude = position.latitude;
- var longitude = position.longitude;

-Get data from api:

- const openweatherURL ='http://api.openweathermap.org/data/2.5/weather';
- const apikey = 'xx';

import 'package:http/http.dart' as http;
class networkHelper {
  String url;
  networkHelper(this.url);
  Future getData() async {
    http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var data = response.body;
      var decodedData = jsonDecode(data);
      return decodedData;
    } else
      print(response.statusCode);
  }
}

- networkHelper networkhelper = networkHelper('$openweatherURL?lat=$latitude&lon=${longitude&appid=$apikey&units=metric');

-access data:
- var weatherData = await networkhelper.getData();
- double temperature = weatherData['main']['temp'];
- var city = weatherData['name'];
