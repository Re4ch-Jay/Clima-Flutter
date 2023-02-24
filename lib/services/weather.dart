import 'package:clima/services/location.dart';
import '../services/networking.dart';

const apiKey = 'de71a86f6c2b8ffd87a86f54e90b64be';

class WeatherModel {
  Future<dynamic> getCityWeather(String cityName) async {
    try {
      Networking networking = Networking(
        url:
            'https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apiKey&units=metric',
      );
      var weatherData = await networking.fetchWeather();
      return weatherData;
    } catch (e) {
      print(e);
    }
  }

  Future<dynamic> getLocationData() async {
    try {
      Location location = Location();
      await location.getCurrentLocation();
      Networking networking = Networking(
        url:
            'https://api.openweathermap.org/data/2.5/weather?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric',
      );
      var weatherData = await networking.fetchWeather();
      return weatherData;
    } catch (e) {
      print(e);
    }
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
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
