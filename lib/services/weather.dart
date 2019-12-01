import '../services/location.dart';
import '../services/networking.dart';

const apiKey = '60223a0a2655f6c1379ff1b548eefaa6';
const openWeatherMapUrl = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
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

  Future<dynamic> getLocationWeatherByName(String cityName) async {
    String url = '$openWeatherMapUrl?q=$cityName&appid=$apiKey&units=metric';
    NetworkHelper nh1 = NetworkHelper(url);
    var weatherData = await nh1.getData();
    return weatherData;
  }

  Future<dynamic> getLocationWeather() async {
    Location uLoc = Location();
    await uLoc.getLocation();

    String url =
        '$openWeatherMapUrl?lat=${uLoc.latitude}&lon=${uLoc.longitude}&appid=$apiKey&units=metric';

    NetworkHelper nh1 = NetworkHelper(url);
    var weatherData = await nh1.getData();

    return weatherData;
  }
}
