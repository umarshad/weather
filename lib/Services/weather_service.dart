import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather_app/Models/weather_api_model.dart';

class WeatherService {
  Future<WeatherData?> fetchWeather(String city) async {
    final response = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=$city&units=metric&appid=ddb7fd82811652ce07c649fc1a93ed47'));
    try {
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());
        return WeatherData.fromJson(data);
      } else {
        throw Exception('Failed to load weather');
      }
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
