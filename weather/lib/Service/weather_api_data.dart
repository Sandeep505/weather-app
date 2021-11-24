//to start call some http request in flutter we will need the flutter http package
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:weather/Model/m_weathermodel.dart';

class WeatherApiClient{
  Future<WeatherApp> getCurrentweather(String location) async{
    var endpoint = Uri.parse(
        "https://api.openweathermap.org/data/2.5/weather?q=$location&appid=9cfe7cf596b8a63d336915f8aee1d190&units=metric"
    );
    var response = await http.get(endpoint);
    var body = jsonDecode(response.body);
   print(WeatherApp.fromJson(body).cityName);


    return WeatherApp.fromJson(body);
  }
}
