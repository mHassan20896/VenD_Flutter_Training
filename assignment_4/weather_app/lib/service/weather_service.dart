import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:weather_app/models/city.dart';
import 'package:weather_app/models/weather.dart';
import 'package:weather_app/network/http.dart';
import 'package:weather_app/network/paths.dart';

class WeatherService {
  late Http http;

  WeatherService() {
    this.http = Http();
  }

  Future<List<City>> getCityList() async {
    String jsonString = await rootBundle.loadString("assets/city_list.json");
    //  List<City> a =  stringToMap(jsonString);
    List<City> cities = await compute(stringToMap, jsonString);
    return cities;
  }

 Future<GetWeatherResponse> getWeatherUpdate(String cityName) async {
    Map<String, String> queryParameters = {
      "q": cityName,
      "appid": "8daa648f320457f41126376a6f6d102c"
    };
    Map<String, dynamic> response =
        await http.get(Path.getWeather, queryParameters);

    return GetWeatherResponse.fromJson(response);
  }

  static List<City> stringToMap(String jsonString) {
    List<dynamic> citiesJson = jsonDecode(jsonString);
    List<City> cities = citiesJson.map<City>((e) => City.fromJson(e)).toList();
    return cities;
  }
}
