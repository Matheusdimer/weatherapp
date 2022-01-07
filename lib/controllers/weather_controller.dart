import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:weatherapp/models/weather_error.dart';
import 'package:weatherapp/models/weather_model.dart';
import 'package:weatherapp/repositories/weather_repository.dart';
import 'package:weatherapp/utils/geolocation.dart';

class WeatherController {
  final _repository = WeatherRepository();
  final searchController = TextEditingController();
  final ValueNotifier<HomeState> _state = ValueNotifier(HomeState.loading);

  late WeatherModel _weather;
  late WeatherError _errorDetail;

  void getWeather() async {
    _state.value = HomeState.loading;

    try {
      var position = await determinePosition();
      var response = await _repository.getData(position);

      searchController.text = "Localização atual";

      if (response.statusCode == 200) {
        _weather = WeatherModel.fromJson(jsonDecode(response.body));
        _state.value = HomeState.success;
      } else {
        _errorDetail = WeatherError.fromJson(jsonDecode(response.body));
        _state.value = HomeState.error;
      }
    } catch (e) {
      _errorDetail = WeatherError.simple(e.toString());
      _state.value = HomeState.error;
    }
  }

  ValueNotifier<HomeState> get state => _state;

  WeatherModel get weather => _weather;

  WeatherError get errorDetail => _errorDetail;
}

enum HomeState { loading, success, error }
