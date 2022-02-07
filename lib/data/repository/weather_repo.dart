import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:weather_app_bloc/data/models.dart';

class WeatherRepo {
  Future<WeatherModel> getWeather(String city) async {
    final result = await http.get(Uri.parse(
        "https://api.openweathermap.org/data/2.5/weather?q=$city&APPID=076c7e3bef2293790056f015acf17fdc"));

    if (result.statusCode != 200) {
      throw Exception();
    }
    final response = json.decode(result.body);
    return WeatherModel.fromJson(response);
  }
}
