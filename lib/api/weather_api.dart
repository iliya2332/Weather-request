// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:developer';

import 'package:weather_example/models/weather_forecast_daily.dart';
import 'package:weather_example/utilities/constants.dart';
import 'package:http/http.dart' as http;

class WeatherApi {
  Future<WeatherForecast> fetchWeatherforeastWithCity(
      {required String cityName}) async {
    var queryParameters = {
      'APPID': Constants.WEATHER_APP_ID,
      'units': 'metric',
      'q': cityName,
    };

    var uri = Uri.https(Constants.WEATHER_BASE_URL_DOMAIN,
        Constants.WEATHER_FORECAST_PATH, queryParameters);

    log('request: ${uri.toString()}');

    var response = await http.get(uri);

    print('responce: ${response.body}');

    if (response.statusCode == 200) {
      return WeatherForecast.fromJson(json.decode(response.body));
    } else {
      throw Exception('Error responce');
    }
  }
}
