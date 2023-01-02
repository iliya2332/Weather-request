import 'package:flutter/material.dart';
import 'package:weather_example/api/weather_api.dart';
import 'package:weather_example/models/weather_forecast_daily.dart';

class WeatherForecastScreen extends StatefulWidget {
  const WeatherForecastScreen({super.key});

  @override
  State<WeatherForecastScreen> createState() => _WeatherForecastScreenState();
}

class _WeatherForecastScreenState extends State<WeatherForecastScreen> {
  late Future<WeatherForecast> forecastObject;
  String _cityName = 'London';

  @override
  void initState() {
    super.initState();
    forecastObject =
        WeatherApi().fetchWeatherforeastWithCity(cityName: _cityName);

    forecastObject.then((weather) {
      print(weather.list![0].weather![0].main);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
